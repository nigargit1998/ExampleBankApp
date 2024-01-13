//
//  KeyBoardType.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 12.01.24.
//

import Foundation
import UIKit

public enum KeyboardType: Int {
    
    case phonePad
    case numberPad
    case ascii
    case decimalPad
    
    public var keyboard: UIKeyboardType {
        switch self {
        case .numberPad:
            return .numberPad
        case .phonePad:
            return .phonePad
        case .decimalPad:
            return .decimalPad
        case .ascii:
            return .asciiCapable
        }
    }
}
