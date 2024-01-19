//
//  Mask(s).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 14.01.24.
//

import UIKit

extension Mask: StyleRepresentable {
    public enum Case: String, CaseIterable {
        case none                 = ""
        case phone                = "+994 (##) ### ## ##"
        case userId               = "######"
        case otp                  = "########"
        case amount               = "#######"
        case accountNo            = "********************"
        case iban                 = "****************************"
        case taxId                = "**********"
        case bday                 = "##.##.####"
        case card                 = "**** **** **** ****"
    }
    
    public static func style(_ with: Case) -> Mask {
        .init(pattern: with.rawValue)
    }
}
