//
//  Transfer(req).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//

import Foundation

public struct TransferRequest: Codable {
    public let sender: String
    public let receiver: String
    
    init(sender: String,
         receiver: String) {
        self.sender = sender
        self.receiver = receiver
    }
}
