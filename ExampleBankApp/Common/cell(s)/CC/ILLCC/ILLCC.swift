//
//  ILLCC.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 18.01.24.
//

import UIKit

class ILLCC: UICollectionViewCell, Configurable {
    public typealias Item = Card

    
    @IBOutlet weak var im: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    public func configure(_ item: Item) -> Self {
        im.image = .init(named: "card")
        let number = "••" + String(item.cardNumber.suffix(4))  + "•"
        label2.text = "\(item.number())"
        label1.text = number + item.cardNetwork.title
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        return self
    }
}
