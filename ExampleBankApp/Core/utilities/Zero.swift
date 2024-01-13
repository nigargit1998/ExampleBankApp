//
//  Zero.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//

import Foundation

public protocol Zero {
    static func zero() -> Self
}

extension Double: Zero {
    public static func zero() -> Double { 0 }
}

extension Int: Zero {
    public static func zero() -> Int { 0 }
}

extension String: Zero {
    public static func zero() -> String { "" }
}

extension Array: Zero {
    public static func zero() -> Array<Element> { [] }
}

extension Bool: Zero {
    public static func zero() -> Bool { false }
}

extension Dictionary: Zero {
    public static func zero() -> Dictionary<Key, Value> { [:] }
}
