//
//  Formatter(ext).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 18.01.24.
//

import Foundation

extension NumberFormatter {
    public static func amount() -> NumberFormatter {
        let formatter = NumberFormatter()
        formatter.decimalSeparator = "."
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }
}
