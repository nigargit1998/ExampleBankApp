//
//  Transfer(m).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//

import Foundation

public class TransferModel: Object {
    @Backend() public var senderCardNumber: String
    @Backend() public var receiverCardNumber: String
}


