//
//  Response.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 11.01.24.
//
import UIKit

public protocol Backendable: Serializable { }
public typealias Backend<Value> = Serialized<Value>

extension Backend where T : Zero {
    public convenience init () {
        self.init(default: .zero())
    }
}

public class ErrorResponse: Response<String> {
    
    @Backend() public var error: String
    @Backend() public var status: Int
    @Backend() public var message: String
    @Backend() public var errors: [AnyError]
    
    public convenience init(error: String,
                status: Int,
                message: String,
                errors: [AnyError]) {
        self.init()
        self.error = error
        self.status = status
        self.message = message
        self.errors = errors
    }
        
    public class AnyError: Object {
        @Backend() public var message: String
        @Backend() public var rejectedValue: String
    }
    
    static func decode (_ data: Data?, _ completion: @escaping (ErrorResponse)-> ()) {
        guard let data = data,
              let json = try? JSONDecoder().decode(ErrorResponse.self, from: data) else {
            return
        }
        completion(json)
    }
}

open class Object: Codable, Backendable {
    
    @Backend() public var description: String
    
    required public init() {}
}

open class Response<T>: Object {
    @Backend(default: nil) public var data: T
}
