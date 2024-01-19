//
//  LBTC.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//

import UIKit

class LBTC: UITableViewCell, Configurable {
    
    typealias Item = LBCM
    
    @IBOutlet weak var im: UIImageView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    func configure(_ item: Item) -> Self {
        label.text = item.text
        im.configure(item.image)
        button.onTap {
            item.tap()
        }
        return self
    }
    
    
}


public class LBCM: LabelCM {
    public var tap: ()-> () = { }
    
    public init(image: Image,
                text: String,
                tap: @escaping ()->() = { }) {
        self.tap = tap
        super.init(text: text, image: image)
    }
}
