//
//  WalletJSONCurrency.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

struct WalletJSONCurrency: Codable {
    var decimals: Int?
    var amount, convertedAmount: Double?
    var unitAmount, convertedCurrency, timestamp: String?
    
    enum CodingKeys: String, CodingKey {
        case amount = "amount"
        case convertedCurrency = "convertedCurrency"
        case timestamp = "timestamp"
        case unitAmount = "unitAmount"
        case convertedAmount = "convertedAmount"
        case decimals = "decimals"
    }
    
    init(from decoder: Decoder) throws {
        let valuesInContainer = try decoder.container(keyedBy: CodingKeys.self)
        convertedCurrency = try valuesInContainer.decode(String.self, forKey: .convertedCurrency)
        timestamp = try valuesInContainer.decode(String.self, forKey: .timestamp)
        unitAmount = try valuesInContainer.decode(String.self, forKey: .unitAmount)
        
        if let decimalsRaw = try? valuesInContainer.decode(String.self, forKey: .decimals),
            let decimalsString = Int(decimalsRaw) {
            decimals = decimalsString
        } else {
            decimals = try valuesInContainer.decode(Int.self, forKey: .decimals)
        }
        
        if let amountStringRaw = try? valuesInContainer.decode(String.self, forKey: .amount),
            let amountString = Double(amountStringRaw) {
            amount = amountString
        } else {
            amount = try valuesInContainer.decode(Double.self, forKey: .amount)
        }
        
        if let convertedAmountStringRaw = try? valuesInContainer.decode(String.self, forKey: .convertedAmount),
            let amountString = Double(convertedAmountStringRaw) {
            convertedAmount = amountString
        } else {
            convertedAmount = try valuesInContainer.decode(Double.self, forKey: .convertedAmount)
        } 
    }
}


