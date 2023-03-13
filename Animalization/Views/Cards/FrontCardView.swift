//
//  FrontCardView.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/09.
//

import SwiftUI

struct FrontCardView: View {
    
    let animal: Animal
    
    var body: some View {
        ZStack {
            animalImage
            imageText
        }.card()
    }
}

struct FrontCardView_Previews: PreviewProvider {
    static var previews: some View {
        FrontCardView(animal: Constants.animals.first!)
    }
}

extension FrontCardView {
    
    private var animalImage: some View {
        Image(animal.filename)
            .resizable()
            .scaledToFill()
            .frame(maxWidth: Constants.cardWidth, maxHeight: Constants.cardHeight)
    }
    
    private var imageText: some View {
        VStack {
            Spacer()
            photographerText
            photographerName
        }.padding()
    }
    
    private var photographerName: some View {
        HStack {
            Text(animal.photographer)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .font(.callout)
            Spacer()
        }
    }
    
    private var photographerText: some View {
        HStack {
            Text("Photographer")
                .foregroundColor(.white)
                .fontWeight(.light)
                .font(.footnote)
            Spacer()
        }
    }
}

