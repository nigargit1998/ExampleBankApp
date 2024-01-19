//
//  SwiftMaskField.swift
//  GitHub: https://github.com/moraisandre/SwiftMaskText
//
//  Created by Andre Morais on 3/9/16.
//  Translated to Swift 3 by: André Santana Ferreira on 31/5/17
//  Translated to Swift 4 by: André Morais on 04/11/17
//  Translated to Swift 4.2 by: Rafael Gustavo Gali on 07/01/19
//  Copyright © 2018 Andre Morais. All rights reserved.
//  Website: http://www.moraisandre.com
//
import UIKit
open class TextField: FLField, ValidationDelegate {
    
    open var item: TextFieldStyle!
    
    public var onSucces: () -> () = { }
    public var onFailed: () -> () = { }
    
    open func configure(_ item: TextFieldStyle) {
        self.item = item
        attributedPlaceholder = item.placeholder.styled(with: StringStyle(  .lineSpacing(2.2),
                                                                            .color(.gray),
                                                                            .maximumLineHeight(.automatic()),
                                                                            .font(.init(name: "System", size: 14) ?? .init()),
                                                                            .alignment(.left)))
        isEnabled = item.editable
        font = .init(name: "System", size: 14)
        keyboardType = item.keyboard.keyboard
        titleTextColour = .gray
        titleActiveTextColour = titleTextColour
        text = item.text
        isSecureTextEntry = item.secure
        titleYPadding = Device.current.screen == .phone ? 8 : 10
        didBeginEditing(handler:  { [weak self] in
            if self?.text?.isEmpty == true && self?.item.isActive == true {
                self?.text = self?.item.prefix
            }
        }).onChange { [weak self] newValue in
            if let weakSelf = self {
                weakSelf.text = weakSelf.item.mask(newValue)
            }
        }
        .onEditingEnded(handler: item.editingDidEnd)
    }
    
    public func validationSuccessful() {
        item.success(text ?? .zero())
        if item.resign {
            endEditing(true)
        }
    }
    
    public func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        item.success(.zero())
    }
}

