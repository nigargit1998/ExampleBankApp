//
//  CardEndpoints.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 16.01.24.
//

import Foundation
import Alamofire

public enum CardEndpoints: EndPointType {
    case create(CardCreateRequest)
    case cards
    case transfer(TransferRequest)
    case delete(CardCreateRequest)
    
    public var path: String {
        switch self {
        case .create:
            return "card/v1/create"
        case .cards:
            return "card/v1/cards"
        case .transfer:
            return "card/v1/transfer"
        case .delete:
            return "card/v1/delete"
        }
    }
    
    public var httpMethod: HTTPMethod {
        switch self {
        case .create, .transfer, .delete:
            return .post
        case .cards:
            return .get
        }
    }
    
    public var parameters: Parameters? {
        switch self {
        case let .create(request):
            return request.params()
            
        case let .transfer(request):
            return request.params()
            
        case let .delete(request):
            return request.params()
        case .cards:
            return nil
        }
    }
    
    public var encoding: ParameterEncoding {
        switch self {
        case .create, .cards, .transfer, .delete:
            return JSONEncoding.prettyPrinted
        }
    }
    
    public var mockName: String {
        switch self {
        case .create:
            return "card_response"
        case .cards:
            return "cards_response"
        case .transfer:
            return "success"
        case .delete:
            return "delete_response"
        }
    }
}

