//
//  ContentViewModel.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/10.
//

import Foundation
import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var splashScreenState = SplashScreenState.on
    
    init() {
        let splashAnimation = LiyAnimation(.spring, duration: 1) {
            self.splashScreenState = .off
        }

        splashAnimation.playAfter(duration: 1.5)
    }
}

enum SplashScreenState {
    case on, off
}
