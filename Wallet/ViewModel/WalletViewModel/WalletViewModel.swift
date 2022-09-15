//
//  WalletViewModel.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Combine

protocol WalletBased {
    func loadData()
}

public class WalletViewModel: ObservableObject, WalletBased { 
    @Published var isLoading = false
    @Published var error: Error? = nil
    @Published var results: [WalletFullTransaction] = []
    @Published var showingTransaction = false
    
    func loadData() {
        self.isLoading = true
        
        do {
            results = try MockJSON.shared.retrieveData()
            self.isLoading = false
            self.error = nil
        } catch let error {
            self.isLoading = false
            self.error = error
        }
    }
}
