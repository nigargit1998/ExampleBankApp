//
//  ViewController.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//

import UIKit

class LoginView: UIViewController {
    
    var viewModel = LoginViewModel()
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var button: UIButton!
    
    @IBAction func login(_ sender: UIButton) {
        ProgressHUD.start()
        viewModel.request {
            ProgressHUD.stop()
            if let cardViewController = self.storyboard?.instantiateViewController(withIdentifier: "CardsView") as? CardsView {
                self.navigationController?.pushViewController(cardViewController, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = Local.loginTitle.rawValue
        tableView?.register(TextFieldTC.nib, forCellReuseIdentifier: TextFieldTC.identifier)
        tableView?.separatorStyle = .none
        button.setTitle(Local.continue.rawValue, for: .normal)
    }
}

extension LoginView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldTC", for: indexPath) as! TextFieldTC
        switch indexPath.row {
        case 0:
            return cell.configure(.init(title: Local.surnname.rawValue))
        case 1:
            return cell.configure(.init(title: Local.name.rawValue))
        case 2:
            return cell.configure(.init(title: Local.birth.rawValue,
                                        mask: .style(.bday),
                                        resign: true))
        case 3:
            return cell.configure(.init(title: Local.gsm.rawValue,
                                        prefix: "+994 ",
                                        mask: .style(.phone),
                                        resign: true))
        default:
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return .size(.TF)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
