//
//  LiyAnimation.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/10.
//

import Foundation
import SwiftUI

final class LiyAnimation {
    let animation: AnimationType
    let duration: Double
    let next: LiyAnimation?
    let delay: Double
    var completion: () -> Void
    
    init(_ animation: AnimationType = .easeInOut, duration: Double, next: LiyAnimation? = nil, delay: Double = 0, completion: @escaping () -> Void) {
        self.animation = animation
        self.duration = duration
        self.next = next
        self.delay = delay
        self.completion = completion
    }
    
    enum AnimationType {
        case easeIn,
             easeOut,
             easeInOut,
             spring
    }
    
    func play() {
        switch animation {
        case .easeInOut:
            withAnimation(.easeInOut(duration: duration).delay(delay)) {
                completion()
            }
        case .easeIn:
            withAnimation(.easeIn(duration: duration).delay(delay)) {
                completion()
            }
        case .easeOut:
            withAnimation(.easeOut(duration: duration).delay(delay)) {
                completion()
            }
        case .spring:
            withAnimation(.interpolatingSpring(stiffness: 30, damping: 8).speed(5).delay(delay)) {
                completion()
            }
        }
                
        if let nextAni = next {
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                nextAni.play()
            }
        }
    }
    
    func playAfter(duration: Double) {
        DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
            self.play()
        }
    }
}
