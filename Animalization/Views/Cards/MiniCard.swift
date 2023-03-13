//
//  Minicard.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/10.
//

import SwiftUI

struct MiniCard: View {
    
    let animal: Animal
    
    var body: some View {
        FrontCardView(animal: animal)
            .minicard()
    }
}

struct MiniCard_Previews: PreviewProvider {
    static var previews: some View {
        MiniCard(animal:  Constants.animals.first!)
    }
}
