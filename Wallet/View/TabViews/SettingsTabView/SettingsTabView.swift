//
//  SettingsTabView.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct SettingsTabView: View {
    @Binding var selectedTab: Int
    
    var body: some View {
        TabContentView() {
            ZStack {
                List {
                    Section {
                        EmptyView()
                    }
                }
                
                Text("No Settings :(")
            }
        }
        .onTapGesture {
            selectedTab = 2
        }
        .ignoresSafeArea()
        .tabItem {Label("Settings", systemImage: "gearshape")}
        .tag(2)
    }
}

struct SettingsTabView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsTabView(selectedTab: .constant(2))
    }
}
