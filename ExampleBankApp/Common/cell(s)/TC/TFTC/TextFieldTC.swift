//
//  TextFieldTC.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 12.01.24.
//

import UIKit

class TextFieldTC: UITableViewCell, Configurable, UITextFieldDelegate {
    typealias Item = TF
    
    @IBOutlet weak var textField: TextField!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(_ item: Item) -> Self {
        textField.configure(item)
        textField.keyboardType = item.keyboard.keyboard
        textField.onEditingEnded(handler: item.editingDidEnd)
        return self
    }
    
  
}

open class TF: TextFieldStyle {
    public init (title: String = .zero(),
                 prefix: String = .zero(),
                 text: String = .zero(),
                 image: UIImage = .init(),
                 error: String = .zero(),
                 keyboard: KeyboardType = .phonePad,
                 mask: Mask? = nil,
                 resign: Bool = false,
                 secure: Bool = false,
                 editable: Bool = true,
                 editing: @escaping ()->() = { }) {
        super.init(label: title,
                   placeholder: title,
                   prefix: prefix,
                   text: text,
                   image: image,
                   error: error,
                   keyboard: keyboard,
                   mask: mask,
                   editingDidEnd: editing,
                   resign: resign,
                   secure: secure,
                   editable: editable)
    }
}
