//
//  Codable(ext).swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 16.01.24.
//

import Foundation
import Alamofire

extension Encodable {
    public func params() -> Parameters {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        if let params = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? Parameters {
            return params
        }
        return [:]
    }
}
