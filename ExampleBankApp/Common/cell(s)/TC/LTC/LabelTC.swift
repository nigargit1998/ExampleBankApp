//
//  LabelTC.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 18.01.24.
//

import UIKit

class LabelTC: UITableViewCell, Configurable {
    typealias Item = LabelCM
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var im: UIImageView!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(_ item: Item) -> Self {
        label.text = item.text
        im.image = item.image
        return self
    }
    
}


public class LabelCM {
    public let text: String
    public let image: UIImage
    init(text: String,
         image: UIImage) {
        self.text = text
        self.image = image
    }
}
