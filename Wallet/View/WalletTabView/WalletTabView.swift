//
//  WalletTab.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct WalletTabView<WalletContent>: View where WalletContent: View {
    let title: String
    let systemImageName: String
    
    let walletContent: () -> WalletContent
    
    init(title bindingTitle: String, systemImageName imageName: String, @ViewBuilder walletContent: @escaping () -> WalletContent) {
        self.walletContent = walletContent
        
        title = bindingTitle
        systemImageName = imageName
    }
    
    var body: some View {
        ZStack {
            WalletColor.mainBackgroundColor.convertToColor()
            
            walletContent() 
        }
        .tabItem {Label(title, systemImage: systemImageName)}
    }
}
