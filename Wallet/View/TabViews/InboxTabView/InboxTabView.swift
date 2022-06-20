//
//  InboxTabView.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct InboxTabView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        TabContentView {
            GeometryReader { geometry in
                NavigationView {
                    VStack {
                        List {
                            Section.init("Transactions to sign") {
                                HStack {
                                    Spacer().frame(width: 10)
                                    
                                    ZStack {
                                        RoundedRectangle.init(cornerRadius: 14)
                                            .fill(WalletColor.walletCustomBlue.convertToColor())
                                        
                                        Text("Hello")
                                            .foregroundColor(.white)
                                    }
                                        .frame(width: 80, height: 46)
                                }
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
        .ignoresSafeArea()
        .tabItem {Label("Inbox", systemImage: "tray")}
        .tag(1)
    }
}

struct InboxTabView_Previews: PreviewProvider {
    static var previews: some View {
        InboxTabView(selectedTab: .constant(0))
    }
}
