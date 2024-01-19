//
//  CardServices.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 16.01.24.
//

import Foundation

public protocol CardNetworkServiceDelegate: NetworkServiceDelegate {
    func request(_ request: CardCreateRequest, completion: @escaping Completion<Card>)
    func request(_ endpoint: CardEndpoints, completion: @escaping Completion<[Card]>)
    func request(_ request: TransferRequest, completion: @escaping Completion<Object>)
}

public class CardNetworkService: NetworkService, CardNetworkServiceDelegate {
    
    public typealias EndPoint = CardEndpoints
    
    public func request(_ request: CardCreateRequest, completion: @escaping Completion<Card>) {
        manager.request(Card.self,
                        endPoint: EndPoint.create(request),
                        completion: completion)
    }
    
    public func request(_ endpoint: CardEndpoints, completion: @escaping Completion<[Card]>) {
        manager.requestArray(Card.self,
                         endPoint: endpoint,
                         completion: completion)
    }
    public func request(_ request: TransferRequest, completion: @escaping Completion<Object>) {
        manager.request(Object.self,
                         endPoint: EndPoint.transfer(request),
                         completion: completion)
    }
}
