//
//  TabCurve.swift
//  To The Moon
//
//  Created by Danil Bochkarev on 25.12.2022.
//

import SwiftUI

struct TabCurve: Shape {
    var tabPoint: CGFloat
    
    var animatableData: CGFloat {
        get { return tabPoint }
        set { tabPoint = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        return Path { path in
            
            path.move(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            
            let mid = tabPoint
            
            path.move(to: CGPoint(x: mid - 40, y: rect.height))
            
            let to = CGPoint(x: mid, y: rect.height - 15)
            let contor1 = CGPoint(x: mid - 10, y: rect.height)
            let contor2 = CGPoint(x: mid - 10, y: rect.height - 15)
            
            let to1 = CGPoint(x: mid + 40, y: rect.height)
            let contor3 = CGPoint(x: mid + 10, y: rect.height - 15)
            let contor4 = CGPoint(x: mid + 10, y: rect.height)
            
            path.addCurve(to: to, control1: contor1, control2: contor2)
            path.addCurve(to: to1, control1: contor3, control2: contor4)
        }
    }
}

struct TabCurve_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabbar()
    }
}

