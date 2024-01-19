//
//  Currency.swift
//  ExampleBankApp
//
//  Created by Mammadova Nigar Rauf on 18.01.24.
//

import Foundation

public enum Currency: String, Codable {
    case azn  = "AZN"
    case usd  = "USD"
    case euro = "EUR"
    case rubl = "RUB"
    case gbp  = "GBP"
    case aed  = "AED"
    case aud  = "AUD"
    case cad  = "CAD"
    case chf  = "CHF"
    case cny  = "CNY"
    case jpy  = "JPY"
    case kzt  = "KZT"
    case nok  = "NOK"
    case sek  = "SEK"
    case tr   = "TRY"
    case gel  = "GEL"
    case dkk  = "DKK"
}

extension Currency: Zero {
    public func symbol() -> String {
        switch self {
        case .azn:
            return "₼"
        case .euro:
            return "€"
        case .usd, .cad, .aud:
            return "$"
        case .rubl:
            return "₽"
        case .gbp:
            return "£"
        case .aed:
            return "د.إ"
        case .chf:
            return "CHF"
        case .cny, .jpy:
            return "¥"
        case .kzt:
            return "лв"
        case .nok, .sek, .dkk:
            return "kr"
        case .tr:
            return "₺"
        case .gel:
            return "₾"
        case _:
            return ""
        }
    }
    
    public static func zero() -> Currency {
        .azn
    }
    
    public func format (_ amount: Double) -> String {
        guard let amount = NumberFormatter.amount()
            .string(from: .init(value: amount)) else { return .zero() + "\(symbol())" }
        return "\(amount) \(symbol())"
    }
    
    public func format2 (_ amount: Double) -> String {
        guard let amount = NumberFormatter.amount()
            .string(from: .init(value: amount)) else { return .zero() + "\(rawValue)" }
        return "\(amount) \(rawValue)"
    }
}
