//
//  TextFieldTC.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 12.01.24.
//

import UIKit

class TextFieldTC: UITableViewCell, Configurable {
    typealias Item = TF
    
    @IBOutlet weak var textField: UITextField!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(_ item: Item) -> Self {
        textField.placeholder = item.placeholder
        textField.keyboardType = item.keyboard.keyboard
        textField.onEditingEnded(handler: item.editingDidEnd)
        return self
    }
}

open class TF: TextFieldStyle {
    public init (title: String = .zero(),
                 text: String = .zero(),
                 keyboard: KeyboardType = .phonePad,
                 editable: Bool = true,
                 editing: @escaping ()->() = { }) {
        super.init(label: title,
                   placeholder: title,
                   text: text,
                   keyboard: keyboard,
                   editingDidEnd: editing,
                   editable: editable)
    }
}
