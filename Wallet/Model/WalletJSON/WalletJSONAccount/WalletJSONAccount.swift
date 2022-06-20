//
//  WalletJSONAccount.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

struct WalletJSONAccount: Codable {
    var assetGuid, address, accountPublicKey, walletID, accountName, imageURL, walletType, chain, balance: String?
    var creationTimestamp, modifiedTimestamp: Int?
    
    var jsonCurrency: WalletJSONCurrency?
    var devicePublicKey: WalletDevicePublicKey?
    
    init(from decoder: Decoder) throws {
        let valuesInContainer = try decoder.container(keyedBy: CodingKeys.self)
        assetGuid = try valuesInContainer.decode(String.self, forKey: .assetGuid) 
        
        jsonCurrency = try valuesInContainer.decode(WalletJSONCurrency.self, forKey: .jsonCurrency)
        
        if let devices = try? valuesInContainer.decode([String].self, forKey: .devicePublicKey) {
            devicePublicKey = WalletDevicePublicKey(devices: devices)
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case assetGuid = "assetGuid"
        case chain = "chain"
        case address = "address"
        case accountPublicKey = "accountPublicKey"
        case walletID = "walletId"
        case accountName = "accountName"
        case imageURL = "imageUrl"
        case walletType = "walletType"
        
        case balance = "balance"
        case creationTimestamp = "creationTimestamp"
        case modifiedTimestamp = "modifiedTimestamp"
        
        case jsonCurrency = "balanceCurrency"
        case devicePublicKey = "devicePublicKey"
    }
}
