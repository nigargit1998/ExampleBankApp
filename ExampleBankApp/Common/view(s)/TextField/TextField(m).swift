//
//  TextField(m).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 12.01.24.
//

import Foundation
import UIKit

public protocol TextFieldStyleConvertable {
    var field: TextFieldStyle { get }
}

open class TextFieldStyle {
    
    public typealias Text = (String) -> ()
    
    public let label: String
    public let placeholder: String
    public let prefix: String
    public let text: String
    public let image: UIImage
    public let error: String
    public let keyboard: KeyboardType
    public var mask: Mask?
    public let validator: Validator
    public var success: Text
    public let resign: Bool
    public let secure: Bool
    public let editable: Bool
    public var editingDidEnd: () -> ()
    
    public init(label: String,
                placeholder: String,
                prefix: String,
                text: String,
                image: UIImage,
                error: String,
                keyboard: KeyboardType,
                mask: Mask?,
                success: @escaping Text = { _ in },
                editingDidEnd: @escaping () -> () = { },
                resign: Bool = false,
                secure: Bool = false,
                editable: Bool = true) {
        self.label = label
        self.placeholder = placeholder
        self.prefix = prefix
        self.text = text
        self.image = image
        self.error = error
        self.keyboard = keyboard
        self.mask = mask
        self.validator = .init()
        self.success = success
        self.resign = resign
        self.secure = secure
        self.editable = editable
        self.editingDidEnd = editingDidEnd
    }
    
    public var isActive: Bool {
        !prefix.isEmpty
    }
    
    public func mask (_ input: String) -> String {
        if let mask = mask {
            return mask.mask(input: input, exhaustive: false)
        }
        return input
    }
}
