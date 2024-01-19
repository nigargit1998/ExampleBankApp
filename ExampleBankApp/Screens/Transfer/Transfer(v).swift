//
//  Transfer(v).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//

import Foundation
import UIKit


class TransferView: UIViewController, UITableViewDataSource, UITableViewDelegate, SelectionCardDelegate {
    
    public var viewModel = TransferViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ILTC.nib, forCellReuseIdentifier: ILTC.identifier)
        tableView.register(TextFieldTC.nib, forCellReuseIdentifier: TextFieldTC.identifier)
        tableView.separatorStyle = .none
        
    }
    func didSelectCard(_ cardNumber: String) {
           viewModel.data.receiverCardNumber = cardNumber
           tableView.reloadData()
       }
    
    @IBAction func transfer(_ sender: Any) {
        viewModel.request {
            ToastView(title: "Success").show()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let iltc = tableView.dequeueReusableCell(withIdentifier: "ILTC") as! ILTC
        let tftc = tableView.dequeueReusableCell(withIdentifier: "TextFieldTC") as! TextFieldTC
        switch indexPath.row {
        case 0:
            return iltc.configure(.init(text: viewModel.data.senderCardNumber, image: .card))
        case 1:
            let text = viewModel.data.receiverCardNumber.isEmpty ? Local.selectCard.rawValue :  viewModel.data.receiverCardNumber
            return iltc.configure(.init(text: text, image: .card))
        default:
            return tftc.configure(.init(title: Local.amount.rawValue,
                                        mask: .style(.amount),
                                        resign: true))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .size(.ITI)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let view = self.storyboard?.instantiateViewController(withIdentifier: "SelectionCardView") as? SelectionCardView {
            view.viewModel.selectedCardNumber = viewModel.data.senderCardNumber
            view.delegate = self
            self.navigationController?.pushViewController(view, animated: true)
        }
    }
}
