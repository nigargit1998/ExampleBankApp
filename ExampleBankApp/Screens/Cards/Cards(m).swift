//
//  Cards(m).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 13.01.24.
//

import Foundation

public class CardsModel: Object {
    @Backend() public var cards: [Card]
}


public class Card: Object {
    @Backend() public var cardNumber: String
    @Backend() public var balance: Double
    @Backend() public var currency: Currency
    @Backend() public var cardNetwork: Network
    @Backend() public var cardType: String
    
    public enum Network: String, Codable {
        case visa       = "VISA"
        case master     = "MASTER"
        case unknown
     
        public var title: String {
            switch self {
            case .visa:       return "VISA"
            case .master:      return "MASTER"
            case .unknown:      return ""
            }
        }
    }
    public func number() -> String {
        currency.format(balance)
    }
    
}


enum CardsViewModelState {
    case idle
    case loading
    case loaded
    case reload
    case error(errorMessage: String)
}
