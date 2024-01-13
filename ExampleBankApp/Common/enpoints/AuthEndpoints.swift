//
//  AuthEndpoints.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//

import Foundation
import Alamofire

public enum AuthEndpoints: EndPointType {
    case login
    
    public var path: String {
        switch self {
        case .login:
            return "auth/v1/login"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .login:
            return .get
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case .login:
            return nil
        }
    }
    
    public var encoding: ParameterEncoding {
        switch self {
        case .login:
            return JSONEncoding.prettyPrinted
        }
    }
    
    public var mockName: String {
        switch self {
        case .login:
            return "success"
        }
    }
}

