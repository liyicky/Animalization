//
//  CardModifier.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/10.
//

import Foundation
import SwiftUI

struct CardModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: Constants.cardWidth, height: Constants.cardHeight)
            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 1)
    }
}

extension View {
    func card() -> some View {
        modifier(CardModifer())
    }
}

struct MiniCardModifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: Constants.minicardWidth, height: Constants.minicardHeight)
            .background(RoundedRectangle(cornerRadius: 15).fill(.white))
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 1)
    }
}

extension View {
    func minicard() -> some View {
        modifier(MiniCardModifer())
    }
}
