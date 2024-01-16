//
//  Services.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//

import Foundation

public protocol AuthNetworkServiceDelegate: NetworkServiceDelegate {
    func request(completion: @escaping Completion<LoginModel>)
}

public class AuthNetworkService: NetworkService, AuthNetworkServiceDelegate {
    
    public typealias EndPoint = AuthEndpoints
    
    public func request(completion: @escaping Completion<LoginModel>) {
        manager.request(LoginModel.self,
                        endPoint: EndPoint.login,
                        completion: completion)
    }
}
