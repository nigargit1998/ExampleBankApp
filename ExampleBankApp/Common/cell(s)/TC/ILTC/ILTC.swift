//
//  LITC.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//

import UIKit

class ILTC: UITableViewCell, Configurable {

    typealias Item = ILCM
    
    @IBOutlet weak var im: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(_ item: Item) -> Self {
        label.text = item.text
        im.configure(item.image)
    
        return self
    }
    
}


public class ILCM : LabelCM {}
