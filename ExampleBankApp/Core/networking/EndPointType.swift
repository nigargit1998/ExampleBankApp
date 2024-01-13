//
//  EndPointType.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//

import Foundation
import Alamofire

public protocol EndPointType: URLConvertible {
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var parameters: Parameters? { get }
    var encoding: ParameterEncoding { get }
    var mockName: String { get }
}

public extension EndPointType {
    
    func asURL() throws -> URL {
        URL(string: baseURL)!
    }
    
    var baseURL: String {
        return "https://nigar.com.az"
        
    }
    
    var headers: HTTPHeaders? {
        return .init([
            //some credentials
        ])
    }
}
