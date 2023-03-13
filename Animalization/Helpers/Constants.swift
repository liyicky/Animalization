//
//  Constants.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/09.
//

import Foundation

enum Constants {
    static let animals: [Animal] = Bundle.main.decode("cardData.json")
    static let decks: [Deck] = Bundle.main.decode("decks.json")
    static let cardHeight: CGFloat = 400
    static let cardWidth: CGFloat = 300
    static let minicardHeight: CGFloat = 200
    static let minicardWidth: CGFloat = 150
    static let appTitle: String = "Animalization"
    static let nextCardAnimationLength = 1.0
    static let cardFlipAnimationLength: Double = 0.4
    static var halfFlipAnimationLength: Double { Constants.cardFlipAnimationLength / 2 }
    static let flashAnimationLength: Double = 0.33
    static let setupDuration = 1.0
}
