//
//  Configure.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 12.01.24.
//

import Foundation

public protocol StyleRepresentable {
    associatedtype Case
    static func style (_ with: Case) -> Self
}
public protocol Configurable: AnyObject {
    associatedtype Item
    @discardableResult func configure(_ item: Item) -> Self
}
