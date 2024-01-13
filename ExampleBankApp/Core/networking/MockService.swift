//
//  MockService.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//
import UIKit
import Alamofire

public final class MockService: Networkable {
    
    public static let shared = MockService()
    
    public func request<T>(_ type: T.Type,
                           endPoint: EndPointType,
                           completion: @escaping (Completion<T>)) where T : Object {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if let url = Bundle(for: T.self).url(forResource: endPoint.mockName, withExtension: "json") {
                if let data = try? Data(contentsOf: url) {
                    if let json = try? JSONDecoder().decode(Response<T>.self, from: data) {
                        completion(.success(json.data))
                    }else {
                        completion(.error(.af(.responseSerializationFailed(reason: .inputFileNil))))
                    }
                }
            } else {
                completion(.error(.af(.responseValidationFailed(reason: .dataFileNil))))
            }
        }
    }
    
    public func requestArray<T>(_ type: T.Type,
                                endPoint: EndPointType,
                                completion: @escaping (Completion<[T]>)) where T : Object {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if let url = Bundle(for: T.self).url(forResource: endPoint.mockName, withExtension: "json") {
                if let data = try? Data(contentsOf: url) {
                    if let json = try? JSONDecoder().decode(Response<[T]>.self, from: data) {
                        completion(.success(json.data))
                    }else {
                        completion(.error(.af(.responseSerializationFailed(reason: .inputFileNil))))
                    }
                }
            } else {
                completion(.error(.af(.responseValidationFailed(reason: .dataFileNil))))
            }
        }
    }
}

