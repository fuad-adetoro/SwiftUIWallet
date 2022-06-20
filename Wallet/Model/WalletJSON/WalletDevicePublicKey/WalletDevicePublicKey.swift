//
//  WalletDevicePublicKey.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

struct WalletDevicePublicKey: Codable {
    var keys: [PublicKeysss]
}

struct PublicKeysss: Codable {
    var deviceID: String
}
