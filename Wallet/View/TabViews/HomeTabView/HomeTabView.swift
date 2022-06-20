//
//  HomeTabView.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct HomeTabView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $selectedTab) {
                SubWalletTabView(selectedTab: $selectedTab)
                
                InboxTabView(selectedTab: $selectedTab)
                
                SettingsTabView(selectedTab: $selectedTab)
            } 
            .accentColor(WalletColor.mainColor.convertToColor())
        }
    }
} 
