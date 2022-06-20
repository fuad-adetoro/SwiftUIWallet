//
//  HomeTabView.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct HomeTabView: View {
    var body: some View {
        GeometryReader { geometry in
            TabView {
                WalletTabView(title: "Sub-Wallets", systemImageName: "wallet.pass") {
                    EmptyView.init()
                }
                .frame(height: geometry.size.height)
                .ignoresSafeArea()
                
                WalletTabView(title: "Inbox", systemImageName: "tray") {
                    EmptyView.init()
                }
                .frame(height: geometry.size.height)
                .ignoresSafeArea()
                
                WalletTabView(title: "Settings", systemImageName: "gearshape") {
                    EmptyView.init()
                }
                .frame(height: geometry.size.height)
                .ignoresSafeArea()
            } 
            .accentColor(WalletColor.mainColor.convertToColor())
        }
    }
} 
