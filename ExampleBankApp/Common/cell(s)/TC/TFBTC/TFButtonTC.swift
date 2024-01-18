//
//  TFButtonTC.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 16.01.24.
//

import UIKit

public class TFButtonTC: UITableViewCell, Configurable, UITextFieldDelegate {
    public typealias Item = TFBCM
    
    @IBOutlet weak var field: TextField!
    @IBOutlet weak var button: UIButton!
    
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    public func configure(_ item: Item) -> Self {
        field.configure(item)
        field.keyboardType = item.keyboard.keyboard
        field.onEditingEnded(handler: item.editingDidEnd)
        button.setTitle(item.buttonTitle,
                        for: .normal)
        button.onTap(handler: item.tap)
        return self
    }
    
}

open class TFBCM: TF {
    let buttonTitle: String
    var tap: ()->() = {}
    public init(title: String = .zero(),
                prefix: String = .zero(),
                text: String = .zero(),
                image: UIImage = .init(),
                error: String = .zero(),
                keyboard: KeyboardType = .phonePad,
                mask: Mask? = nil,
                resign: Bool = false,
                secure: Bool = false,
                editable: Bool = true,
                editing: @escaping () -> () = { },
                buttonTitle: String,
                tap: @escaping ()->() = { }) {
        self.buttonTitle = buttonTitle
        self.tap = tap
        super.init (title: title,
                    prefix: prefix,
                    text: text,
                    image: image,
                    error: error,
                    keyboard: keyboard,
                    mask: mask,
                    resign: resign,
                    secure: secure,
                    editable: editable,
                    editing: editing)
    }
}

