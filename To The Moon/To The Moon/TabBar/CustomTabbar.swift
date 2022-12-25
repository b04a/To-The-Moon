//
//  CustomTabbar.swift
//  To The Moon
//
//  Created by Danil Bochkarev on 25.12.2022.
//

import SwiftUI

struct CustomTabbar: View {
    @State var selectedTab = "chart.bar"
    @State var tabPoints: [CGFloat] = []
    
    var body: some View {
        
        
        ZStack(alignment: .bottom, content: {
            
            if selectedTab == "chart.bar" {
                CryptoPage()
            } else {
                Color("TabBG")
                    .ignoresSafeArea()
            }
            

            HStack(spacing: 0) {
                TabBarButton(image: "chart.bar", selectedTab: $selectedTab, tabPoints: $tabPoints)

                TabBarButton(image: "bookmark", selectedTab: $selectedTab, tabPoints: $tabPoints)

                TabBarButton(image: "message", selectedTab: $selectedTab, tabPoints: $tabPoints)

                TabBarButton(image: "person", selectedTab: $selectedTab, tabPoints: $tabPoints)
            }
            .padding()
            .background(
                Color.white
                    .clipShape(TabCurve(tabPoint: getCurvePoint() - 15))
            )
            .cornerRadius(30)
            .padding(.horizontal)
            .shadow(color: .black.opacity(0.3), radius: 2)

        })
        
    }
    
    
    func getCurvePoint() -> CGFloat {
        if tabPoints.isEmpty {
            return 10
        } else {
            switch selectedTab {
            case "chart.bar":
                return tabPoints[0]
            case "bookmark":
                return tabPoints[1]
            case "message":
                return tabPoints[2]
            default:
                return tabPoints[3]
            }
        }
    }
}

struct TabBarButton: View {
    
    var image: String
    @Binding var selectedTab: String
    @Binding var tabPoints: [CGFloat]
    
    var body: some View {
        GeometryReader { reader -> AnyView in
            let midX = reader.frame(in: .global).midX
            
            DispatchQueue.main.async {
                
                if tabPoints.count <= 4 {
                    tabPoints.append(midX)
                }
            }
            
            return AnyView (
                Button {
                    let impactMed = UIImpactFeedbackGenerator(style: .soft)
                        impactMed.impactOccurred()
                    
                    withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.5, blendDuration: 0.5)) {
                        selectedTab = image
                    }
                    
                } label: {
                    Image(systemName: image)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("TabSelected"))
                        .offset(y: selectedTab == image ? -5 : 0)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
        }
        .frame(height: 30)
    }
}

struct CustomTabbar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbar()
    }
}
