//
//  WalletApp.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct WalletDataResult: Codable {
    var type: String?
}

@main
struct WalletApp: App { 
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    let data = try! MockJSON.shared.retrieveData()
                    
                    let decoder = JSONDecoder.init()
                    
                    var walletData: [WalletDataResult] = .init()
                    
                    if let walletDataResult = try? decoder.decode(WalletDataResult.self, from: data) {
                        print("CONVERTED!")
                    } else {
                        print("CANNOT CONVERT!")
                        let dict = MockJSON.shared.convertToDictionary(data: data)
                        print("NO CONVERT: \(dict)") 
                    }
                
                    print()
                }
        }
    }
}
