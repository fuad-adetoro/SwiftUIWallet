//
//  SubWalletTabView.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct SubWalletTabView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        TabContentView {
            List {
                Section {
                    EmptyView()
                }
            }
        }
        .onTapGesture {
            selectedTab = 0
        }
        .ignoresSafeArea()
        .tabItem {Label("Sub-Wallets", systemImage: "wallet.pass")}
        .tag(0)
    }
}

struct SubWalletTabView_Previews: PreviewProvider {
    static var previews: some View {
        SubWalletTabView(selectedTab: .constant(0))
    }
}
