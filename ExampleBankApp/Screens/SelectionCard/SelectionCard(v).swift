//
//  SelectionCard(v).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 19.01.24.
//

import Foundation
import UIKit

protocol SelectionCardDelegate: AnyObject {
    func didSelectCard(_ cardNumber: String)
}

class SelectionCardView: UIViewController, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: SelectionCardDelegate?
    public var viewModel = SelectionCardViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ILTC.nib, forCellReuseIdentifier: ILTC.identifier)
        tableView.separatorStyle = .none
        ProgressHUD.start()
        viewModel.request {
            self.render(state: .loaded)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.data.cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ILTC", for: indexPath) as! ILTC
        return cell.configure(.init(text: viewModel.data.cards[indexPath.row].cardNumber, image: .card))
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        .size(.ITI)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        render(state: .loading)
        let selectedCardNumber = viewModel.data.cards[indexPath.row].cardNumber
        delegate?.didSelectCard(selectedCardNumber)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func render(state: CardsViewModelState){
        switch state {
        case .loaded:
            ProgressHUD.stop()
            tableView?.reloadData()
        case .loading:
            ProgressHUD.start()
        case _:
            break
        }
    }
}
