//
//  Login(vm).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 12.01.24.
//

import Foundation
import UIKit

class LoginViewModel: NSObject {

    var data = LoginModel()

    func request(completion: @escaping ()->()) {
        AuthNetworkService().request { result in
            switch result {
            case let .success(d):
                self.data = d
                completion()
            case .error(let e):
                print(e)
            }
        }
    }
}
