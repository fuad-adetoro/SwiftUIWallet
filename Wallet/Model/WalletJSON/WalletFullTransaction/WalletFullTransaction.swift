//
//  WalletFullTransaction.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

struct WalletFullTransaction: Decodable {
    var type: String?
    var data: WalletData?
    
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case data = "data" 
    }
}
