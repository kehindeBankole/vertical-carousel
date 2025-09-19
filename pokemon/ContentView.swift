//
//  ContentView.swift
//  pokemon
//
//  Created by Kehinde Bankole on 16/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    func cardRotation(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let height = proxy.size.height
        
        let progress = minY / height
        let angleForEachCard: CGFloat = -10
        let cappedProgress = progress < 0 ? min(max(progress, -3), 0) : max(min(progress, 3), 0)
        return cappedProgress * angleForEachCard
    }
    
    func yOffset(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let height = proxy.size.height
        
        let progress = minY / height
        

        let pullStrength: CGFloat = 100
        let offset = progress * pullStrength
        
        return offset
    }
    
    func cardScale(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView(axis: .vertical)).minY
        let height = proxy.size.height
        let progress = abs(minY / height)
        

        let maxScale: CGFloat = 1.0
        let minScale: CGFloat = 0.95
        return max(minScale, maxScale - (progress * 0.1))
    }
    
    var body: some View {
        GeometryReader{
            let size = $0.size
            ScrollView(.vertical){
                LazyVStack(spacing: -100) {
                    ForEach(cards.indices, id: \.self) { index in
                        PokeCard(card: cards[index])
                            .frame(width: 360 , height: 287)
                            .visualEffect { content, proxy in
                                content
                                    .offset(x: -150)
                                    .rotationEffect(
                                        .init(degrees: cardRotation(proxy)),
                                        anchor: .trailing
                                    )
                                    .offset(x: 250)
                                    .offset(y: yOffset(proxy))
                                    .scaleEffect(cardScale(proxy))
                            }
                            .zIndex(Double(cards.count - abs(index - cards.count/2)))
                    }
                }.scrollTargetLayout()
            }
            .safeAreaPadding(.vertical , (size.height * 0.5) - 143)
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.viewAligned(limitBehavior: .always))
            .scrollTargetLayout()
            .overlay{
                Divider()
                    .background(.black)
            }
        }
    }
}

#Preview {
    ContentView()
}
