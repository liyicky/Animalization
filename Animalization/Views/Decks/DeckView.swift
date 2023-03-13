//
//  DeckView.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/13.
//

import SwiftUI

struct DeckView: View {
    
    let deck: Deck
    
    @StateObject var vm = DeckViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                cardPile
                flashMarks
            }
            endScreen
            answerButtons
        }
        .navigationTitle(deck.name)
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            vm.setupDeck(deck)
        }
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: Constants.decks.first!)
    }
}

extension DeckView {
    private var cardPile: some View {
        ZStack {
            ForEach(vm.cards.indices, id: \.self) { index in
                animalCard(animal: vm.cards[index], isTopCard: index == vm.cards.count-1)
            }
        }
    }
    
    private func animalCard(animal: Animal, isTopCard: Bool) -> some View {
        cardSides(animal: animal, isTopCard: isTopCard)
            .transition(.slide)
            .zIndex(isTopCard ? 999 : 0)
            .allowsHitTesting(isTopCard ? true : false)
            .offset(x: isTopCard ? 0 : animal.randomOffset, y: isTopCard ? 0 : animal.randomOffset)
            .rotationEffect(.degrees(isTopCard ? 0 : animal.randomOffset))
    }
    
    private func cardSides(animal: Animal, isTopCard: Bool) -> some View {
        ZStack {
            FrontCardView(animal: animal)
                .rotation3DEffect(.degrees(isTopCard ? vm.rotation : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(isTopCard ? vm.flipped ? 0 : 1 : 1)
            BackCardView(animal: animal)
                .rotation3DEffect(.degrees(isTopCard ? vm.rotation + 180 : 0), axis: (x: 0, y: 1, z: 0))
                .opacity(isTopCard ? vm.flipped ? 1 : 0 : 0)
        }
    }
    
    @ViewBuilder
    private var answerButtons: some View {
        if vm.deckState == .playing || vm.deckState == .submitting {
            VStack {
                HStack {
                    answerButton(animalName: vm.answers[0])
                    answerButton(animalName: vm.answers[1])
                }
                HStack {
                    answerButton(animalName: vm.answers[2])
                    answerButton(animalName: vm.answers[3])
                }
            }
            .padding()
        }
    }
    
    private func answerButton(animalName: String) -> some View {
        Button {
            vm.submitAnswer(animalName)
        } label: {
            Text(animalName)
                .padding()
                .background(.ultraThickMaterial)
                .cornerRadius(7)
        }
        .disabled(vm.deckState != .playing)
    }
    
    @ViewBuilder
    private var flashMarks: some View {
        if vm.deckState == .submitting {
            ZStack {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
                    .fontWeight(.thin)
                    .font(.system(size: 200))
                    .opacity(vm.passing ? 1 : 0)
                
                Image(systemName: "x.circle")
                    .foregroundColor(.red)
                    .fontWeight(.thin)
                    .font(.system(size: 200))
                    .opacity(vm.failing ? 1 : 0)
            }
        }
    }
    
    @ViewBuilder
    private var endScreen: some View {
        if vm.deckState == .finished {
            ScrollView {
                VStack {
                    ForEach(vm.stats) { statistic in
                        HStack {
                            Text(statistic.animal.name)
                                .font(.title)
                            Image(systemName: statistic.wasCorrect ? "checkmark.circle.fill" : "x.circle.fill")
                                .foregroundColor(statistic.wasCorrect ? .green : .red)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}
