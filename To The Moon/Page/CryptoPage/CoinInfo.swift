//
//  CoinInfo.swift
//  To The Moon
//
//  Created by Danil Bochkarev on 26.12.2022.
//

import SwiftUI

struct CoinInfo: View {
    //BTC, ETH, XRP, BNB, ATOM, LTC, MATIC, SOL, DOT
    var numCoin: Int
    var fullNameCoin: String
    var nameImageCoins: String
    
    @State var isAnimation = false
    @State private var value = true
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("TabBG")
                    .ignoresSafeArea()
                
                HStack(spacing: 25) {
                    
                    Text("\(numCoin)")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                        .overlay {
                            Circle()
                                .foregroundColor(Color("TabBG"))
                                .frame(width: 30, height: 30)
                                .opacity(0.2)
                                .scaleEffect(isAnimation ? 0.95 : 1)
                                .animation(Animation.easeInOut.repeatForever(), value: value)
                            
                            Circle()
                                .foregroundColor(Color("TabSelected"))
                                .frame(width: 60, height: 60)
                                .opacity(0.1)
                                .scaleEffect(isAnimation ? 0.95 : 1)
                                .animation(Animation.easeInOut.repeatForever(), value: value)

                        }
                        .onAppear {
                            withAnimation(.linear(duration: 0.5)) {
                                self.isAnimation = true
                                value = false
                            }
                        }
                        .padding(.trailing, 5)

                    HStack {
                        Image(nameImageCoins)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .clipped()
                            .font(.system(size: 30))
                            .foregroundColor(.orange)
                        
                        VStack(alignment: .leading) {
                            Text("\(fullNameCoin)")
                                .foregroundColor(.black)
                                .fontWeight(.medium)
                            
                            HStack(spacing: 1) {
                                Text("323,5")
                                    .font(.system(size: 13))
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                                Text("Bn")
                                    .font(.system(size: 13))
                                    .foregroundColor(.black)
                                    .opacity(0.5)
                            }
                        }
                    }
                    
                    Text("16813 $")
                        .font(.system(size: 20))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    ZStack {
                        Color.red.opacity(0.2)
                        
                        HStack {
                            Image(systemName: "chevron.down")
                                .font(.system(size: 14))
                                .foregroundColor(Color("lowPrice"))
                            
                            Text("0,11 %")
                                .font(.system(size: 14))
                                .fontWeight(.medium)
                                .foregroundColor(Color("lowPrice"))
                        }
                    }
                    .frame(width: 80, height: 35)
                    .cornerRadius(10)
                }
                .frame(width:380, height: 50)
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 3)
            }
        }
    }
}

struct CoinInfo_Previews: PreviewProvider {
    static var previews: some View {
        CoinInfo(numCoin: 3, fullNameCoin: "BTC", nameImageCoins: "btc")
    }
}
