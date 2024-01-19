//
//  Cards(v).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 13.01.24.
//

import Foundation
import UIKit

class CardsView: UIViewController {
    
    @IBOutlet weak var tableView: UITableView?
    var cellCount = 1
    var viewModel = CardsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.register(TFButtonTC.nib, forCellReuseIdentifier: TFButtonTC.identifier)
        tableView?.register(LabelTC.nib, forCellReuseIdentifier: LabelTC.identifier)
        tableView?.separatorStyle = .none
        self.navigationItem.title = Local.createCards.rawValue
    }
}

extension CardsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TFButtonTC", for: indexPath) as! TFButtonTC
            return cell.configure(.init(mask: .style(.card),
                                        resign: true,
                                        buttonTitle: Local.create.rawValue,
                                        tap: {
                guard let text = cell.field.text else { return }
                self.render(state: .loading)
                self.viewModel.request(text) {
                        self.render(state: .reload)
                    }
            }))
        case _:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelTC", for: indexPath) as! LabelTC
            return cell.configure(.init(text: viewModel.data.cards[indexPath.row - 1].cardNumber,
                                        image: .card))
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .size(.TF)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if indexPath.row > 0 {
            if let cardViewController = self.storyboard?.instantiateViewController(withIdentifier: "CardView") as? CardView {
                self.navigationController?.pushViewController(cardViewController, animated: true)
            }
        }
    }
    func render(state: CardsViewModelState){
        switch state {
        case .reload:
            ProgressHUD.stop()
            self.cellCount = viewModel.data.cards.count + 1
            tableView?.reloadData()
        case .loading:
            ProgressHUD.start()
        case _:
            break
        }
    }
}
