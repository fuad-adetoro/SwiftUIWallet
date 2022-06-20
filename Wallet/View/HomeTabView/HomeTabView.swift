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
                TabContentView {
                    EmptyView.init()
                }
                .onTapGesture {
                    selectedTab = 0
                }
                .frame(height: geometry.size.height)
                .ignoresSafeArea()
                .tabItem {Label("Sub-Wallets", systemImage: "wallet.pass")}
                .tag(0)
                
                TabContentView {
                    GeometryReader { geometry in
                        NavigationView {
                            VStack {
                                List {
                                    Section.init("Transactions to sign") {
                                        Text("HEY THERE!")
                                    }
                                }
                                .listStyle(GroupedListStyle())
                            }
                            
                            .navigationTitle("Inbox")
                        }
                        .frame(height: geometry.size.height)
                    }
                }
                .onTapGesture {
                    selectedTab = 1
                }
                .frame(height: geometry.size.height)
                .ignoresSafeArea()
                .tabItem {Label("Inbox", systemImage: "tray")}
                .tag(1)
                
                TabContentView() {
                    EmptyView.init()
                }
                .onTapGesture {
                    selectedTab = 2
                }
                .frame(height: geometry.size.height)
                .ignoresSafeArea()
                .tabItem {Label("Settings", systemImage: "gearshape")}
                .tag(2)
            } 
            .accentColor(WalletColor.mainColor.convertToColor())
        }
    }
} 
