//
//  WalletJSONDevicePublicKey.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

struct WalletJSONDevicePublicKey {
    var deviceID: String
    
    enum CodingKeys: String, CodingKey {
        case zero = "0"
    }
}
