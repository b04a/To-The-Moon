//
//  Main.swift
//  To The Moon
//
//  Created by Danil Bochkarev on 25.12.2022.
//

import SwiftUI

struct CryptoPage: View {
    var fullNameCoins = ["BTC", "ETH", "XRP", "BNB", "ATOM", "LTC", "MATIC", "SOL", "DOT"]
    var nameImageCoins = ["btc", "eth", "xrp", "bnb", "atom", "ltc", "matic", "sol", "dot"]
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("TabBG")
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    ForEach(1..<10) { index in
                        CoinLine(numCoins1: index, fullNameCoins: fullNameCoins[index - 1], nameImageCoins: nameImageCoins[index - 1])
                    }
                    .frame(width:380, height: 50)
                }
            }
        }
    }
}

struct CoinLine: View {
    var numCoins1: Int
    var fullNameCoins: String
    var nameImageCoins: String
    
    var body: some View {
        
        NavigationLink {
            Home()
        } label: {
            CoinInfo(numCoin: numCoins1, fullNameCoin: fullNameCoins, nameImageCoins: nameImageCoins)
                //.background(Color.red)
        }
        //.background(Color.red)
//        Button {
//
//        } label: {
//            CoinInfo(numCoin: numCoins1, fullNameCoin: fullNameCoins, nameImageCoins: nameImageCoins)
//        }
    }
}




struct CryptoPage_Previews: PreviewProvider {
    static var previews: some View {
        CryptoPage()
    }
}
