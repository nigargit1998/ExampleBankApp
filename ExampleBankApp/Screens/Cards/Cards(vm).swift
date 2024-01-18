//
//  Cards(vm).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 13.01.24.
//

import Foundation
import UIKit

class CardsViewModel: NSObject {

    var data = CardsModel()
    
    func request(_ cardNumber: String, completion: @escaping ()->()) {
        CardNetworkService().request(.init(cardNumber: cardNumber)) { result in
            switch result {
            case let .success(d):
                self.data.cards.append(d)
                completion()
            case .error(let e):
                print(e)
            }
        }
    }
}
