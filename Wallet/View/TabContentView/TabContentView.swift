//
//  WalletTab.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct TabContentView<WalletContent>: View where WalletContent: View {
    let walletContent: () -> WalletContent
    
    init(@ViewBuilder walletContent: @escaping () -> WalletContent) {
        self.walletContent = walletContent
    }
    
    var body: some View {
        ZStack {
            walletContent() 
        }
    }
}
