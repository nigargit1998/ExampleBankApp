//
//  Card(vm).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 18.01.24.
//

import Foundation
import UIKit

class CardViewModel: NSObject {

    var data = CardModel()
    
    func request(completion: @escaping ()->()) {
        CardNetworkService().request(.cards, completion: { result in
            switch result {
            case let .success(d):
                self.data.cards = d
                completion()
            case .error(let e):
                print(e)
            }
        })
    }
    
    
    func requestDelete(cardNumber: String, completion: @escaping ()->()) {
        CardNetworkService().request(.delete(.init(cardNumber: cardNumber)), completion: { result in
            switch result {
            case let .success(d):
                self.data.cards = d
                completion()
            case .error(let e):
                print(e)
            }
        })
    }
}
