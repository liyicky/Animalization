//
//  CardFan.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/10.
//

import SwiftUI

struct CardFan: View {
    
    var animals: [Animal]
    
    var body: some View {
        ZStack {
            images
            appTitle
        }
    }
}

struct CardFan_Previews: PreviewProvider {
    static var previews: some View {
        CardFan(animals: [Constants.animals[0], Constants.animals[1], Constants.animals[2]])
    }
}

extension CardFan {
    private var images: some View {
        HStack {
            MiniCard(animal: animals[0])
                .offset(x: UIScreen.main.bounds.width * 0.2, y: 20)
                .rotationEffect(Angle(degrees: -10.0), anchor: .bottom)
            MiniCard(animal: animals[1])
            MiniCard(animal: animals[2])
                .offset(x: -UIScreen.main.bounds.width * 0.2, y: 20)
                .rotationEffect(Angle(degrees: 10.0), anchor: .bottom)
            
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
    }
    
    private var appTitle: some View {
        ZStack {
            Text(Constants.appTitle)
                .foregroundStyle(
                    .white.gradient.shadow(
                        .inner(color: .black.opacity(0.9), radius: 1)
                    )
                )
                .fontWeight(.heavy)
                .font(.system(size: 50))
        }
    }
}
