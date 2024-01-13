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
    public let text: String
    public let keyboard: KeyboardType
    public var success: Text
    public let editable: Bool
    public var editingDidEnd: () -> ()
    
    public init(label: String,
                placeholder: String,
                text: String,
                keyboard: KeyboardType,
                success: @escaping Text = { _ in },
                editingDidEnd: @escaping () -> () = { },
                editable: Bool = true) {
        self.label = label
        self.placeholder = placeholder
        self.text = text
        self.keyboard = keyboard
        self.success = success
        self.editable = editable
        self.editingDidEnd = editingDidEnd
    }

    
}
