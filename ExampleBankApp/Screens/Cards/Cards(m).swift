//
//  Cards(m).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 13.01.24.
//

import Foundation

public class CardsModel: Object {
    @Backend var cards: [Card]
}


public class Card: Object {
    @Backend var cardNumber: String
}


enum CardViewModelState {
    case idle
    case loading
    case loaded
    case reload
    case error(errorMessage: String)
}
