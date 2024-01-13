//
//  State.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 12.01.24.
//

import Foundation
import UIKit

public protocol StoreState: Equatable {}
public protocol ViewState: StoreState {}

public extension Equatable where Self: StoreState {
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return false
    }
}

public protocol StatefulView: AnyObject {
    func render(state: State)
}


public enum State {
    case loading
    case error(Error)
    case loaded
}
