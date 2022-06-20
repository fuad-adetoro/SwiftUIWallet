//
//  WalletColor.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation
import SwiftUI

enum WalletColor: String {
    case mainColor = "WalletMainColor"
    case mainBackgroundColor = "WalletMainBackgroundColor"
    case walletCustomBlue = "WalletCustomBlue"
    case walletMessageNotificationColor = "WalletMessageNotificationColor" 
}

extension WalletColor {
    func convertToColor() -> Color {
        Color(self.rawValue)
    }
    
    func convertToUIColor() -> UIColor {
        UIColor(self.convertToColor())
    }
}
