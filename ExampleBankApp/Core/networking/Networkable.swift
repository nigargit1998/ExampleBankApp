//
//  Networkable.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//


import UIKit
import Alamofire

public enum Result<Success, Failure> where Failure: Error {
    case success(Success)
    case error(Errors)
}

public enum Errors: Error {
    case error(ErrorResponse)
    case af(AFError)
}

public protocol NetworkServiceDelegate: AnyObject {
    typealias Completion<T> = (Result<T,AFError>)->()
}

public protocol Networkable: NetworkServiceDelegate {
    func request<T:Object>(_ type: T.Type,
                           endPoint: EndPointType,
                           completion: @escaping (Completion<T>))
    func requestArray<T:Object>(_ type: T.Type,
                           endPoint: EndPointType,
                           completion: @escaping (Completion<[T]>))
}

extension Parameters {
    func print () {
        debugPrint(NSDictionary(dictionary: self))
    }
}
