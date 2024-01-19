//
//  Transfer(vm).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//

import Foundation
import UIKit

class TransferViewModel: NSObject {

    var data = TransferModel()
  
    
    func request(completion: @escaping ()->()) {
        CardNetworkService().request(.init(sender: data.senderCardNumber,
                                           receiver: data.receiverCardNumber) ,completion: { result in
            switch result {
            case .success:
                completion()
            case .error(let e):
                print(e)
            }
        })
    }
    
}
