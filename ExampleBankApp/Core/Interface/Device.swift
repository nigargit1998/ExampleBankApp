//
//  Device.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 13.01.24.
//
import UIKit
import Foundation

extension Device {
    public enum Screen: Double {
        /// iPhone 6, 7, 8, SE, SE2
        case phone
        /// other devices...
        case newPhone
        static func screen (_ dioganal: Double) -> Screen {
            (dioganal == 4.7 || dioganal == 5.5) ? .phone : .newPhone
        }
    }
    
    public var screen: Screen {
        .screen(diagonal)
    }
    
    public var bounds: CGRect {
        UIScreen.main.bounds
    }
}
