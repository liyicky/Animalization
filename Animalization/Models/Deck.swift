//
//  Deck.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/09.
//

import Foundation

struct Deck: Codable {
    var id: Int
    var name: String
    var animalIds: [Int]
    
    var animals: [Animal] {
        Constants.animals.filter { animalIds.contains($0.id) }
    }
}

extension Deck: Identifiable {
    
}
