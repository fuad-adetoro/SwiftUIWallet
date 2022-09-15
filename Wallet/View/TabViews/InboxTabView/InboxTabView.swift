//
//  InboxTabView.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import SwiftUI
import UIKit

struct InboxTabView: View {
    @Binding var selectedTab: Int
    
    @ObservedObject var viewModel = WalletViewModel()
    
    var body: some View {
        TabContentView {
            GeometryReader { geometry in
                NavigationView {
                    VStack {
                        List {
                            Section.init("Transactions to sign") {
                                ForEach(viewModel.results, id: \.uuid) { result in
                                    InboxTransactionsView(result: .constant(result))
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
        .onAppear(perform: {
            viewModel.loadData()
        })
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

struct InboxTransactionsView: View {
    @Binding var result: WalletFullTransaction
    
    @Environment(\.viewController) private var viewControllerHolder: UIViewController?
    
    var body: some View {
        VStack {
            Spacer().frame(height: 7)
            
            Button {
                self.viewControllerHolder?.present(style: .formSheet) {
                    TransactionView(transaction: $result)
                }
            } label: {
                HStack {
                    Spacer().frame(width: 10)
                    
                    InboxRectangleView(text:
                            .constant(
                                "***"
                                + String(result.data?.jsonAccount?.address?.suffix(4) ?? "3789")
                            )
                    )
                    
                    Spacer().frame(width: 10)
                    
                    InboxMessageView(result: $result)
                    
                    Spacer()
                    
                    InboxImageView.init(result: $result)
                        .frame(width: 55)
                    
                    Spacer().frame(width: 10)
                }
            }
            
            Spacer().frame(height: 7)
        }
        .onTapGesture {
            // back up for button up top not working unless long pressed...
            
            self.viewControllerHolder?.present(style: .formSheet) {
                TransactionView(transaction: $result)
            }
        }
    }
}

struct InboxMessageView: View {
    @Binding var result: WalletFullTransaction
    
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(result.data?.jsonAccount?.accountName ?? "My first account")
                .font(.body)
                .foregroundColor(colorScheme != .dark ? .black : .white)
                
            Text(
                String(result.data?.createdAt?.returnDate() ?? "1:15pm, 10 Jun 2022 ")
                + String(result.data?.source ?? "MetaMask"))
                .font(.system(size: 10.0))
                .foregroundColor(colorScheme != .dark ? .black : .white)
        }
    }
}

struct InboxImageView: View {
    @Binding var result: WalletFullTransaction
    
    var body: some View {
        HStack {
            Spacer()
            
            AsyncImage(url: URL(string: String(result.data?.sourceImageURL ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/MetaMask_Fox.svg/1200px-MetaMask_Fox.svg.png"))!) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 25, height: 25)
            
            Spacer().frame(width: 5)
            
            Circle.init()
                .fill(WalletColor.walletMessageNotificationColor.convertToColor())
                .frame(width: 16, height: 16, alignment: .center)
            
            Spacer()
        }
    }
}

struct InboxRectangleView: View {
    @Binding var text: String
    @EnvironmentObject var viewModel: WalletViewModel
    
    var width: CGFloat = 80
    var height: CGFloat = 46
    var font: Font = .body
    
    init(font: Font = .body, width: CGFloat = 80, height: CGFloat = 46, text: Binding<String>) {
        self.width = width
        self.height = height
        self.font = font
        _text = text
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle.init(cornerRadius: 14)
                .fill(WalletColor.walletCustomBlue.convertToColor())
            
            Text(text)
                .font(font)
                .foregroundColor(.white)
        }
            .frame(width: width, height: height)
    }
}
