//
//  TransactionView.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI

struct TransactionView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var transaction: WalletFullTransaction
    
    @State private var showingConfirmation = false
    
    var body: some View {
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    // The list is great for things like settings, but for a lot more control I could've used a scrollView.
                    List {
                        TransactionHeaderView.init(transaction: $transaction)
                        
                        TransactionNetworkSectionView.init(transaction: $transaction)
                        
                        TransactionCarefulView(transaction: $transaction)
                        
                        TransactionGasSectionViews(transaction: $transaction)
                        
                        TransactionWalletPolicyViews(transaction: $transaction)
                        
                        Button(action: {
                            showingConfirmation = true
                        }, label: {
                            Text("Confirm and Send")
                        })//.buttonStyle(.plain)
                        
                        Button(action: {
                            
                            
                        }, label: {
                            Text("Cancel Transaction")
                        })//.buttonStyle(.plain)
                    }
                    .listStyle(.insetGrouped)
                }
                .navigationTitle("Confirm Transaction")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            print("Get Help")
                        } label: {
                            Text("Get Help")
                                .foregroundColor(WalletColor.mainColor.convertToColor())
                        }
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Close")
                                .foregroundColor(WalletColor.mainColor.convertToColor())
                        }
                    }
                }
            }
            .alert("Try again later...",
                isPresented: $showingConfirmation) {
              }
        }
    }
}

struct TransactionConfirmButtonView: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .center) {
                Button {
                    
                } label: {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            
                            Text("Confirm and Send")
                            
                            Spacer()
                        }
                        Spacer()
                    }
                    .background(Color.blue)
                }
            }
            .frame(width: geometry.size.width - 50, height: 30)
        }
    }
}

struct TransactionWalletPolicyViews: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        Section {
            Text("Wallet Policy")
        }
        
        Section(header: Text("1 of 1 devices")) {
            HStack {
                Spacer().frame(width: 20)
                Image.init(systemName: "iphone")
                Spacer().frame(width: 20)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Your device")
                        .fontWeight(.semibold)
                    
                    Text(transaction.data?.jsonAccount?.devicePublicKey?.devices[0] ??  "0403d89e1a1701c900c0b3722f4b33c3b6f972729c82e827cccff73bbf25643c8b1cfcd47792f3d91b68be14a60fd1")
                        .font(.system(size: 8.0))
                        .foregroundColor(.gray)
                        .fontWeight(.semibold)
                        //.fixedSize(horizontal: true, vertical: false)
                        .lineLimit(1)
                }
                
                Spacer().frame(width: 10)
            }
        }
        
        Section(header: Text("Note")) {
            VStack {
                Spacer().frame(height: 6.5)
                HStack {
                    Text("By signing this transaction you confirm you have reviewed and accepted the transaction details.")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
                Spacer().frame(height: 6.5)
            }
        }
    }
}

struct TransactionGasSectionViews: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        Section {
            Text("Transaction Details")
        }
        
        Section(header: Text("nonce")) {
            Text(String(transaction.data?.transaction?.nonce ?? 18))
        }
        
        Section(header: Text("gasPrice")) {
            Text(String(transaction.data?.transaction?.gasPrice ?? 66) + " " + "GWEI")
        }
        
        Section(header: Text("gasLimit")) {
            Text(String(transaction.data?.transaction?.gasLimit ?? 21000))
        }
    }
}

struct TransactionCarefulView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        Section(content: {
            EmptyView.init()
        }, header: {
            HStack {
                Image.init(systemName: "exclamationmark.triangle.fill")
                    .imageScale(.large)
                    .foregroundColor(.gray)
                
                Text("Be careful: TrustVault does not recognise this tranasaction, only continue if you know what you are doing.")
                    .font(.system(size: 8.0))
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
        })
    }
}


struct TransactionHeaderView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        Section(content: {
            EmptyView.init()
        }, header: {
            Text("Confirm MetaMask Transaction")
                .padding([.leading, .trailing])
        }, footer: {
            Text("Initiated on **Jun 10** at **1:15pm** via MetaMask. Please check that all details are correct before approving this transaction.")
        })
        .headerProminence(.increased)
    }
}

struct TransactionNetworkSectionView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        Section(header: Text("Iniated By")) {
            TransactionInitiationView(transaction: $transaction)
        }
        
        Section(header: Text("MetaMask Network")) {
            TransactionNetworkView(transaction: $transaction)
        }
        
        Section(header: Text("From")) {
            TransactionFromAddressView(transaction: $transaction)
        }
        
        Section(header: Text("To")) {
            TransactionToAddressView(transaction: $transaction)
        }
        
        Section(header: Text("Amount")) {
            TransactionAmountSentView(transaction: $transaction)
        }
        
        Section(header: Text("Transaction Costs")) {
            TransactionCostView(transaction: $transaction)
        }
    }
}

struct TransactionInitiationView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        VStack {
            Spacer().frame(height: 6.5)
            
            HStack {
                Spacer().frame(width: 10)
                
                Image(systemName: "mail.fill")
                    .imageScale(.large)
                
                Spacer().frame(width: 10)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(transaction.data?.initiatedBy ?? "Paul Yardley")
                        .font(.body)
                    Text(transaction.data?.source ?? "MetaMask")
                        .font(.footnote)
                }
                
                Spacer()
            }
            
            Spacer().frame(height: 6.5)
        }
    }
}

struct TransactionNetworkView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        VStack {
            Spacer().frame(height: 6.5)
            
            HStack {
                Spacer().frame(width: 10)
                
                Circle.init()
                    .fill(WalletColor.walletMessageNotificationColor.convertToColor())
                    .frame(width: 16, height: 16, alignment: .center)
                
                Spacer().frame(width: 10)
                
                Text("Main Ethereum Network")
                    .font(.body)
                
                Spacer()
                
                AsyncImage(url: URL(string: String(transaction.data?.sourceImageURL ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/MetaMask_Fox.svg/1200px-MetaMask_Fox.svg.png"))!) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 25, height: 25)
                
                Spacer().frame(width: 10)
            }
            
            Spacer().frame(height: 6.5)
        }
    }
}

struct TransactionFromAddressView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        VStack {
            Spacer().frame(height: 6.5)
            
            HStack {
                InboxRectangleView(font: .footnote, width: 65, height: 34, text: .constant("***" + String(transaction.data?.jsonAccount?.address?.suffix(4) ?? "3789"))
                )
                
                Spacer().frame(width: 10)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(transaction.data?.jsonAccount?.accountName ?? "My first name")
                        .font(.body)
                    
                    Text(String(transaction.data?.jsonAccount?.jsonCurrency?.amount ?? 83.174823687451624) + " " + String(transaction.data?.assetSymbol ?? "ETH"))
                        .font(.footnote)
                }
                
                Spacer()
            }
            
            Spacer().frame(height: 6.5)
        }
    }
}

struct TransactionToAddressView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        VStack {
            Spacer().frame(height: 6.5)
            
            HStack {
                Image.init(systemName: "placeholdertext.fill")
                    .frame(width: 20, height: 20)
                
                Spacer().frame(width: 10)
                Text(transaction.data?.transaction?.toAddress ?? "0x6304D92ecf45eb5B5892c20D2B2E4B3915c39fd6")
                    .font(.footnote)
                
                Spacer()
            }
            
            Spacer().frame(height: 6.5)
        }
    }
}

struct TransactionAmountSentView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        VStack {
            Spacer().frame(height: 6.5)
            
            HStack {
                AsyncImage(url: URL(string: String(transaction.data?.jsonAccount?.imageURL ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png"))!) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 35, height: 35)
                
                Spacer().frame(width: 10)
                Text("0.1")
                    .font(.title)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    Text(transaction.data?.assetSymbol ?? "ETH")
                        .font(.footnote)
                        .fontWeight(.bold)
                    
                    Text("99.21 GBP")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                
                Spacer().frame(width: 10)
            }
            
            Spacer().frame(height: 6.5)
        }
    }
}

struct TransactionCostView: View {
    @Binding var transaction: WalletFullTransaction
    
    var body: some View {
        VStack {
            Spacer().frame(height: 6.5)
            
            HStack {
                ZStack {
                    AsyncImage(url: URL(string: String(transaction.data?.jsonAccount?.imageURL ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/1257px-Ethereum_logo_2014.svg.png"))!) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .id(transaction.data?.jsonAccount?.accountPublicKey ?? "random")
                    .frame(width: 35, height: 35)
                }
                .frame(width: 35, height: 35)
                
                Spacer().frame(width: 10)
                Text("0.001386")
                    .font(.title)
                
                Spacer()
                
                VStack(alignment: .trailing, spacing: 0) {
                    Text(transaction.data?.assetSymbol ?? "ETH")
                        .font(.footnote)
                        .fontWeight(.bold)
                    
                    Text("1.37 GBP")
                        .font(.footnote)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                }
                
                Spacer().frame(width: 10)
            }
            
            Spacer().frame(height: 6.5)
        }
    }
}
