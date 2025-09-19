//
//  PokeCard.swift
//  pokemon
//
//  Created by Kehinde Bankole on 16/09/2025.
//

import SwiftUI

struct PokeCard: View {
   var card:Card
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(card.color.gradient)
        }
    }
}

#Preview {
    PokeCard(card: .init(color: .red))
}
