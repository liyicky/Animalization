//
//  Animal.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/09.
//

import Foundation

struct Animal: Codable {
    var id: Int
    var filename: String
    var photographer: String
    var name: String
    var answers: [String]
    
    let randomOffset = Double.random(in: -10.0...10.0)
}

extension Animal: Identifiable {
    
}
