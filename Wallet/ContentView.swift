//
//  ContentView.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.primary)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                WalletColor.mainBackgroundColor.convertToColor()
                
                HomeTabView()
            }
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
