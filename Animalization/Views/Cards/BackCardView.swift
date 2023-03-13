//
//  BackCardView.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/10.
//

import SwiftUI

struct BackCardView: View {
    
    let animal: Animal
    
    var body: some View {
        VStack {
            Text(animal.name)
                .foregroundColor(.black)
                .font(.largeTitle)
                .fontWeight(.black)
        }
        .card()
    }
}

struct BackCardView_Previews: PreviewProvider {
    static var previews: some View {
        BackCardView(animal: Constants.animals.first!)
    }
}
