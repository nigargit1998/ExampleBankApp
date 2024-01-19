//
//  Image(ext).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//


import UIKit

public protocol ImageConvertable {
    var image: Image { get }
}

public enum Image: String {
    case none
    case card                   = "card"
}

public extension UIImage {
    convenience init (name: Image) {
        if name == .none {
            self.init()
        } else {
            self.init(named: name.rawValue)!
        }
    }
}

extension UIImageView: Configurable {
    @discardableResult
    public func configure(_ item: Image) -> Self {
        image = .init(name: item)
        return self
    }
}
