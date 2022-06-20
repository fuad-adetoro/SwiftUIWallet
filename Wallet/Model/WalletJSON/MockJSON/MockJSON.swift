//
//  MockJSON.swift
//  Wallet
//
//  Created by Fuad on 20/06/2022.
//

import Foundation

class MockJSON {
    static let shared = MockJSON()
    
    let jsonData = """
   [
   {
   "type": "EXTERNAL_ETH_TRANSACTION",
   "data": {
   "account": {
   "assetGuid": "9d415afa-1a0e-4ded-8f71-119f8f2033ec",
   "address": "0x6304D92ecf45eb5B5892c20D2B2E4B3915c39fd6",
   "balance": "83174823687451624000",
   "balanceCurrency": {
   "unitAmount": "83174823687451624000",
   "amount": "83.174823687451624",
   "convertedAmount": "82514.70586750792731160776",
   "convertedCurrency": "GBP",
   "timestamp": "2022-06-13T13:29:33.827Z",
   "decimals": 18
   },
   "accountPublicKey":
   "041a9122d2c1fc7a7c96f1cd2866a5249c82e96ef134d1946498d5f251fecb65a52426659f22f5c24a83c260ae683f 8b297565146608b01407d4a890e6c423e58c",
   "walletId": "090577fa-62d2-49b2-897c-d05057612213",
   "accountName": "My first account",
   "assetName": "ETH",
   "devicePublicKey": [
   "0403d89e1a1701c900c0b3722f4b33c3b6f972729c82e827cccff73bbf25643c8b1cfcd47792f3d91b68be14a60fd1 015e5c7d260d5143a1b5a757b4cb5aab906e"
   ],
   "policyHSMProvenanceSignature":
   "bb981f2c5f99e7d6f664e910354efdfdbbcd608bb3ef3f0f0f909a6c6b2ddd20b8d919037cd0a88a008dd73baa1207 a511c75be021191893ce2f4d6421ec6e92",
   "accountHSMProvenanceSignature":
   "342c4635e7cd6d8faf63cd37926d647a120261127d2e8bc90ea06d1c242b4976e103cd15b07e6ab57015336a2ef e794a751b8d720e1da95029fb1068dbeffff8",
   "accountWalletPath": [],
   "policy": {
   "walletId": "090577fa-62d2-49b2-897c-d05057612213",
   "recovererSchedules": [
   [
   {
   "keys": [
   "047c5e15091230f87a2e2e14d11dea53103aad06e4e271db282621ccc377fdf100c339557350839aa88a6809879 c83e1c3f37fc6a42d5d6bbe10eeeca1e9fd81ac",
   "041314f8f6dbe81d26b86ebad770a3170afb3609d444113a477e78bc8078fccd4ed6ef7c84254c2699b98d9c2ec1 94804b70ab477e3f4127ff71bcbb05b61b2ac6",
   "04aed00304191764c4ab31225881cd071af3f62d7f2480758e0a5f58ba8543e316553e3acc3c7c0d50f718c7f947d a8908155808f72071168a514ffc869d9e0b50",
   "04a875847170e3542b731f8cd21f24f61573cc5b3a6af60125eb42fe11d8816e20a6972f50b7938c76ffa5f633627e 0988ae881849527684b59ae13181081ab802",
   "042170e7a2ca8d94bb459909c79828305a6038dde10f25e5b00dac36bfda559d2027eff8df58ed8b611c493c641c 97defd870c44f045ef7577990a8935276482e1"
   ],
   "quorumCount": 2
   }
   ],
   [
   {
   "keys": [
   "047b49c8d0292dc426d2545ceb83795d94336599b8945d9d6a582a8c584b85e8c9ce665ee0917ca6e53ea7fa00 28ed1e1efabe3f147e0e7062e0a09782adfced9d"
   ],
   "quorumCount": 1
   }
   ],
   [
   {
   "keys": [
   "048aba94e2d1e56b0e34a77ea0691787ee0bfbc50f39bad959d4fa62b137c89a9744eeade7d6ce47968ee8f63f89 b04805871d955308a3c134fbd70a29aaa22844"
   ],
   "quorumCount": 1
   }
   ]
   ],
   "creationTimestamp": 1615287697,
   "creationDeadline": 1615719653,
   "masterPublicKey":
   "041a9122d2c1fc7a7c96f1cd2866a5249c82e96ef134d1946498d5f251fecb65a52426659f22f5c24a83c260ae683f 8b297565146608b01407d4a890e6c423e58c",
   "version": 19,
   "delegateSchedules": [
   [
   {
   "keys": [
   "0403d89e1a1701c900c0b3722f4b33c3b6f972729c82e827cccff73bbf25643c8b1cfcd47792f3d91b68be14a60fd1 015e5c7d260d5143a1b5a757b4cb5aab906e"
   ],
   "quorumCount": 1
   }
   ]
   ]
   },
   "recoverersVersion": 19,
   "isPendingPolicyChange": false,
   "creationTimestamp": 1535978208,
   "modifiedTimestamp": 1581685649,
   "subWalletId": "090577fa-62d2-49b2-897c-d05057612213/ETH/0",
   "chain": "ETHEREUM",
   "totalValue": {
   "convertedAmount": "82515.53489198770548495426",
   "convertedCurrency": "GBP",
   "timestamp": "2022-06-13T13:30:09.448Z"
   },
   "walletType": "BLOCKCHAIN",
   "imageUrl":
   "https://s3-eu-west-1.amazonaws.com/production-assets.trustology-int.com/images/cryptoassets/eth.png" },
   "chainRate": "992.06349",
   "assetRate": "992.06349",
   "transactionCostWarning": "NORMAL",
   "assetType": "ETH",
   "trustId": "1dbd3bff-d40f-43e0-b58b-35ee5cf9cb52",
   "assetGuid": "9d415afa-1a0e-4ded-8f71-119f8f2033ec",
   "publicKeySignaturePairs": [],
   "transaction": {
   "gasLimit": "21000",
   "chainId": 1,
   "v": 1,
   "fromAddress": "0x6304d92ecf45eb5b5892c20d2b2e4b3915c39fd6",
   "to": "0x61421676cedf75da04234be898bbdfdd1905628b",
   "nonce": 18,
   "value": "100000000000000000",
   "decodedInput": null,
   "gasPrice": "66000000000"
   },
   "assetSymbol": "ETH",
   "status": "CANCELLED",
   "state": "AWAITING_SIGNATURES",
   "type": "EXTERNAL_ETH_TRANSACTION",
   "source": "MetaMask",
   "submitToNetwork": false,
   "policyGuid": "6386780d-7242-27e6-d491-435215c3f77a",
   "createdAt": "2022-06-10T12:15:05.326Z",
   "initiatedBy": "Paul Yardley",
   "subWalletId": {
   "id": "090577fa-62d2-49b2-897c-d05057612213",
   "type": "ETH",
   "index": 0
   },
   "sourceImageUrl":
   "https://s3-eu-west-1.amazonaws.com/production-assets.trustology-int.com/metamask-118x108" }
   }
   ]
   """.data(using: .utf8)!
    
    func retrieveData() throws -> [WalletFullTransaction] {
        
        let decoder = JSONDecoder()
        
        var fullTransactions = [WalletFullTransaction]()
        
        if let jsonPetitions = try? decoder.decode([WalletFullTransaction].self, from: jsonData) {
            fullTransactions = jsonPetitions
        }
         
        return fullTransactions
    }
}
