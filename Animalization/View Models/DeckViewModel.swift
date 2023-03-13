//
//  DeckViewModel.swift
//  Animalization
//
//  Created by Jason Cheladyn on 2023/03/13.
//

import Foundation
import SwiftUI

final class DeckViewModel: ObservableObject {
    
    private var deck: Deck? = nil
    var deckState: DeckState = .loading
    
    @Published var cards = [Animal]()
    @Published var answers = [String]()
    @Published var flipped = false
    @Published var rotation: CGFloat = 0
    @Published var passing = false
    @Published var failing = false
    
    var stats = [DeckStatistic]()
    
    enum DeckState {
        case loading, playing, submitting, finished
    }
    
    var topCard: Animal {
        cards.isEmpty ? Constants.animals.first! : cards[cards.count-1]
    }
    
    func setupDeck(_ deck: Deck) {
        self.deckState = .loading
        self.deck = deck
        
        var delay = 0.0
        for card in deck.animals {
            LiyAnimation(.spring, duration: Constants.setupDuration) {
                self.cards.append(card)
            }.playAfter(duration: delay)
            
            delay += 0.2
        }

        LiyAnimation(duration: Constants.setupDuration) {
            self.setupAnswers()
            self.deckState = .playing
        }.playAfter(duration: delay)
    }

    func nextCard() {
        LiyAnimation(duration: Constants.nextCardAnimationLength) {
            self.deckState = .playing
            self.cards.remove(at: self.cards.count-1)
            self.flipped = false
            self.rotation = 0.0
            self.setupAnswers()
            self.checkForEndGame()
        }.playAfter(duration: Constants.nextCardAnimationLength)
    }
    
    func setupAnswers() {
        self.answers = []
        var newAnswers = topCard.answers
        newAnswers.append(topCard.name)
        
        for answer in newAnswers.shuffled() {
            self.answers.append(answer)
        }
    }
    
    func submitAnswer(_ animalName: String) {
        deckState = .submitting
        
        let answerWasCorrect = animalName == topCard.name
        let statistic = DeckStatistic(animal: topCard, wasCorrect: answerWasCorrect)
        stats.append(statistic)
        
        flip()
        flash(passing: answerWasCorrect)
        nextCard()
    }

    func flip() {
        let secondTurn = LiyAnimation(.spring, duration: Constants.halfFlipAnimationLength, next: nil) {
            self.rotation += 90
        }
        
        let flipViews = LiyAnimation(.spring, duration: 0.01, next: secondTurn) {
            self.flipped.toggle()
        }
        
        let firstTurn = LiyAnimation(.spring, duration: Constants.halfFlipAnimationLength, next: flipViews) {
            self.rotation += 90
        }
        
        firstTurn.play()
    }
    
    func flash(passing: Bool) {
        let flashOff = LiyAnimation(duration: Constants.flashAnimationLength, delay: Constants.flashAnimationLength) {
            if passing { self.passing = false } else { self.failing = false }
        }
        
        let flashOn = LiyAnimation(duration: Constants.flashAnimationLength, next: flashOff, delay: Constants.flashAnimationLength) {
            if passing { self.passing = true } else { self.failing = true }
        }
        
        flashOn.play()
    }
    
    func checkForEndGame() {
        if cards.isEmpty {
            deckState = .finished
        }
    }
}
