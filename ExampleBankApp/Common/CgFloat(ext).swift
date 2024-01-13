//
//  CgFloat(ext).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 13.01.24.
//

import Foundation
import UIKit

extension CGFloat {
    
    public enum ComponentName {
        case TF
        case ITI
        case L
    }
    
    public static func size (_ name: ComponentName) -> CGFloat {
        let device = Device.current.screen
        switch name {
        case  .TF:
            return device == .phone ? 72 : 78.0
        case .ITI:
            return device == .phone ? 60 : 72
        case .L:
            return device == .phone ? 30 : 36
        }
    }
    
    public static func automatic() -> CGFloat {
        UITableView.automaticDimension
    }
}
