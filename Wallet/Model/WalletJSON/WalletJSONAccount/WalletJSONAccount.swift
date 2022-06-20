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
    }
}
