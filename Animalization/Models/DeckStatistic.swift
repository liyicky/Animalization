//
//  DeckStatistic.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/13.
//

import Foundation

struct DeckStatistic {
    let id = UUID()
    let animal: Animal
    let wasCorrect: Bool
}

extension DeckStatistic: Identifiable {
    
}
