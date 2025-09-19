//
//  Card.swift
//  pokemon
//
//  Created by Kehinde Bankole on 16/09/2025.
//

import Foundation
import SwiftUI

struct Card: Identifiable {
    var id: UUID = UUID()
    var name: String = "iJustine"
    var color: Color
}

var cards: [Card] = [
    .init( color: .green),
    .init(color: .yellow),
    .init(color: .blue),
]


