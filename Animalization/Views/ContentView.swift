//
//  ContentView.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/09.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ContentViewModel()
    
    let miniAnimals: [Animal] = [
        Constants.animals.randomElement()!,
        Constants.animals.randomElement()!,
        Constants.animals.randomElement()!
    ]
    
    var body: some View {
        NavigationStack {
            VStack {
                CardFan(animals: miniAnimals)
                    .scaleEffect(vm.splashScreenState == .on ? 0.5 : 1)
                
                if vm.splashScreenState == .on {
                    splashScreen
                } else {
                    mainScreen
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension ContentView {
    private var splashScreen: some View {
        VStack {
            ProgressView()
        }
    }
    
    private var mainScreen: some View {
        VStack {
            deckList
            Spacer()
        }
    }
    
    private var deckList: some View {
        VStack {
            ForEach(Constants.decks) { deck in
                NavigationLink(destination: DeckView(deck: deck)) {
                    Text(deck.name)
                        .padding()
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.8)
                        .background(.ultraThickMaterial)
                        .cornerRadius(15)
                        .shadow(color: .black.opacity(0.3), radius: 1, x: 0, y: 1)
                }
            }
        }
    }
}

