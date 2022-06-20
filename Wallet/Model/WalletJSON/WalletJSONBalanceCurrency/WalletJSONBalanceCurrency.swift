//
//  WalletJSONBalanceCurrency.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

struct WalletJSONBalanceCurrency: Codable {
    var unitAmount, decimals: Int?
    var convertedAmount, amount: Double?
    var convertedCurrency, timestamp: String?
}
