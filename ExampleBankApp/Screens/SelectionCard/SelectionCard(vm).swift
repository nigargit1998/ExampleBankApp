//
//  SelectionCard(vm).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//

import Foundation
import UIKit

class SelectionCardViewModel: NSObject {
    var selectedCardNumber = String()
    var data = SelectionCardModel()
    
    func request(completion: @escaping ()->()) {
        CardNetworkService().request(.cards, completion: { result in
            switch result {
            case let .success(d):
                self.data.cards = d.filter({$0.cardNumber != self.selectedCardNumber})
                completion()
            case .error(let e):
                print(e)
            }
        })
    }
  
}
