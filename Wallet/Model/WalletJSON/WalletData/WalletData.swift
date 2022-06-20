//
//  WalletData.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

struct WalletData: Codable {
    var transactionCostWarning, assetGuid, policyGuid, assetType, trustId, assetSymbol, status, state, type, source, createdAt, initiatedBy, sourceImageURL: String?
    var chainRate, assetRate: Double?
    
    var jsonAccount: WalletJSONAccount?
    var transaction: WalletJSONTransaction?
    var jsonCurrency: WalletJSONCurrency? = nil
    var devicePublicKey: WalletDevicePublicKey? = nil
    
    init(from decoder: Decoder) throws {
        let valuesInContainer = try decoder.container(keyedBy: CodingKeys.self)
        transactionCostWarning = try valuesInContainer.decode(String.self, forKey: .transactionCostWarning)
        assetGuid = try valuesInContainer.decode(String.self, forKey: .assetGuid)
        policyGuid = try valuesInContainer.decode(String.self, forKey: .policyGuid)
        assetType = try valuesInContainer.decode(String.self, forKey: .assetType)
        trustId = try valuesInContainer.decode(String.self, forKey: .trustId)
        assetSymbol = try valuesInContainer.decode(String.self, forKey: .assetSymbol)
        status = try valuesInContainer.decode(String.self, forKey: .status)
        state = try valuesInContainer.decode(String.self, forKey: .state)
        type = try valuesInContainer.decode(String.self, forKey: .type)
        source = try valuesInContainer.decode(String.self, forKey: .source)
        createdAt = try valuesInContainer.decode(String.self, forKey: .createdAt)
        initiatedBy = try valuesInContainer.decode(String.self, forKey: .initiatedBy)
        sourceImageURL = try valuesInContainer.decode(String.self, forKey: .sourceImageURL)
        
        jsonAccount = try valuesInContainer.decode(WalletJSONAccount.self, forKey: .jsonAccount)
        
        transaction = try valuesInContainer.decode(WalletJSONTransaction.self, forKey: .transaction)
        
        //devicePublicKey = try valuesInContainer.decode(WalletDevicePublicKey.self, forKey: .devicePublicKey)
        
        //jsonCurrency = try valuesInContainer.decode(WalletJSONCurrency.self, forKey: .jsonCurrency)
        
        if let chainRateString = try? valuesInContainer.decode(String.self, forKey: .chainRate),
            let rate = Double(chainRateString) {
            chainRate = rate
        } else {
            chainRate = try valuesInContainer.decode(Double.self, forKey: .chainRate)
        }
        
        if let assetRateString = try? valuesInContainer.decode(String.self, forKey: .assetRate),
            let rate = Double(assetRateString) {
            assetRate = rate
        } else {
            assetRate = try valuesInContainer.decode(Double.self, forKey: .assetRate)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case transactionCostWarning = "transactionCostWarning"
        case assetGuid = "assetGuid"
        case policyGuid = "policyGuid"
        case assetType = "assetType"
        case trustId = "trustId"
        case assetSymbol = "assetSymbol"
        case status = "status"
        case state = "state"
        case type = "type"
        case source = "source"
        case createdAt = "createdAt"
        case initiatedBy = "initiatedBy"
        case sourceImageURL = "sourceImageUrl"
        case chainRate = "chainRate"
        case assetRate = "assetRate"
        case jsonAccount = "account"
        case transaction = "transaction"
        case jsonCurrency = "balanceCurrency"
        case devicePublicKey = "devicePublicKey"
    }
}

