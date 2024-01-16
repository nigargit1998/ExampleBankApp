//
//  AmountRule.swift
//  Design
//
//  Created by khayal on 13.06.22.
//

import Foundation

public class AmountRule: Rule {

    public let min: Double
    public let max: Double
    
    public init (min: Double, max: Double) {
        self.min = min
        self.max = max
    }
    
    public func validate(_ value: String) -> Bool {
        guard let v = Double(value) else { return false }
        return v <= max && v >= min
    }
    
    public func errorMessage() -> String {
        ""
    }
}
