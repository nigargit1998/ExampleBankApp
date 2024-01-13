//
//  NetworkService.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//

import Foundation

open class NetworkService: NSObject, NetworkServiceDelegate {
    open var manager: Networkable {
        MockService.shared
    }
}
