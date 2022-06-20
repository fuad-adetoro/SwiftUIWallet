//
//  Transaction.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

struct WalletJSONTransaction: Codable {
    var gasLimit, chainId, aValue, nonce, value, gasPrice: Int?
    var fromAddress, toAddress: String?
    
    enum CodingKeys: String, CodingKey {
        case fromAddress = "fromAddress"
        case toAddress = "to"
        case gasLimit = "gasLimit"
        case chainId = "chainId"
        case aValue = "v"
        case nonce = "nonce"
        case value = "value"
        case gasPrice = "gasPrice"
    }
    
    init(from decoder: Decoder) throws {
        let valuesInContainer = try decoder.container(keyedBy: CodingKeys.self)
        fromAddress = try valuesInContainer.decode(String.self, forKey: .fromAddress)
        toAddress = try valuesInContainer.decode(String.self, forKey: .toAddress)
        
        if let gasLimitRaw = try? valuesInContainer.decode(String.self, forKey: .gasLimit),
            let gasLimitInt = Int(gasLimitRaw) {
            gasLimit = gasLimitInt
        } else {
            gasLimit = try valuesInContainer.decode(Int.self, forKey: .gasLimit)
        }
        
        if let chainIdRaw = try? valuesInContainer.decode(String.self, forKey: .chainId),
            let chainIdInt = Int(chainIdRaw) {
            chainId = chainIdInt
        } else {
            chainId = try valuesInContainer.decode(Int.self, forKey: .chainId)
        }
        
        if let aValueRaw = try? valuesInContainer.decode(String.self, forKey: .aValue),
            let aValueInt = Int(aValueRaw) {
            aValue = aValueInt
        } else {
            aValue = try valuesInContainer.decode(Int.self, forKey: .aValue)
        }
        
        if let nonceRaw = try? valuesInContainer.decode(String.self, forKey: .nonce),
            let nonceInt = Int(nonceRaw) {
            nonce = nonceInt
        } else {
            nonce = try valuesInContainer.decode(Int.self, forKey: .nonce)
        }
        
        if let valueRaw = try? valuesInContainer.decode(String.self, forKey: .value),
            let valueInt = Int(valueRaw) {
            value = valueInt
        } else {
            value = try valuesInContainer.decode(Int.self, forKey: .value)
        }
        
        if let gasPriceRaw = try? valuesInContainer.decode(String.self, forKey: .gasPrice),
            let gasPriceInt = Int(gasPriceRaw) {
            gasPrice = gasPriceInt
        } else {
            gasPrice = try valuesInContainer.decode(Int.self, forKey: .gasPrice)
        }
    }
}
