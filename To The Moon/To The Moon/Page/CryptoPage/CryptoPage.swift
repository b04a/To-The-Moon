//
//  Main.swift
//  To The Moon
//
//  Created by Danil Bochkarev on 25.12.2022.
//

import SwiftUI

struct CryptoPage: View {
    var body: some View {
        ZStack {
            Color("TabBG")
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ForEach(1..<10) { index in
                    CoinLine()
                }
            }
        }
    }
}

struct CoinLine: View {
    
    var body: some View {
        
        Button {
            print("123")
        } label: {
            HStack(spacing: 20) {
                
                Text("1")
                    .foregroundColor(.black)
                    .fontWeight(.medium)

                HStack {
                    Image(systemName: "bitcoinsign.circle.fill")
                        .font(.system(size: 30))
                        .foregroundColor(.orange)
                    
                    VStack(alignment: .leading) {
                        Text("BTC")
                            .foregroundColor(.black)
                            .fontWeight(.medium)
                        
                        Text("Bitcoin")
                            .foregroundColor(.black)
                            .opacity(0.5)
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
            .frame(width: 350, height: 50)
            .background(Color.white)
            .cornerRadius(30)
        }

        

    }
}

struct CryptoPage_Previews: PreviewProvider {
    static var previews: some View {
        CryptoPage()
    }
}
