//
//  Home.swift
//  chartTest
//
//  Created by Danil Bochkarev on 24.12.2022.
//

import SwiftUI
import Charts

struct Home: View {
    @State var sampleAnalytics: [SiteView] = sample_analytics
    @State var currentTab: String = "7 Days"
    @State var currentActiveItem: SiteView?
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    HStack {
                        Text("View")
                            .fontWeight(.semibold)
                        
                        Picker("", selection: $currentTab) {
                            Text("День")
                                .tag("Days")
                            
                            Text("Week")
                                .tag("Week")
                            
                            Text("Month")
                                .tag("Month")
                        }
                        .pickerStyle(.segmented)
                        .padding(.leading, 80)
                    }
                    
                    let totalValue = sampleAnalytics.reduce(0.0) { partialResult, item in
                        item.views + partialResult
                    } 
                    
                    Text(totalValue.stringFormat)
                        .font(.largeTitle.bold())
                    
                    AnimateChart()
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .fill(.white.shadow(.drop(radius: 2)))
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("Swift Charts")
            .onChange(of: currentTab) { newValue in
                sampleAnalytics = sample_analytics
                if newValue != "7 Days" {
                    for (index, _) in sampleAnalytics.enumerated() {
                        sampleAnalytics[index].views = .random(in: 1500...10000)
                    }
                }
                
                animatedGraph(fromChange: true)
            }
        }
    }
    
    @ViewBuilder
    func AnimateChart() -> some View {
        let max = sampleAnalytics.max { item1, item2 in
            return item2.views > item1.views
        }?.views ?? 0
        Chart {
            ForEach(sampleAnalytics) { item in
                
                LineMark(
                    x: .value("Hour", item.hour, unit: .hour),
                    y: .value("Views", item.animate ? item.views : 0)
                )
                .interpolationMethod(.catmullRom)
                .foregroundStyle(Color("Blue").gradient)
                
                if let currentActiveItem, currentActiveItem.id == item.id {
                    RuleMark(x: .value("Hour", currentActiveItem.hour, unit: .hour))
                        .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
                        .annotation(position: .top) {
                            VStack(alignment: .leading, spacing: 6) {
                                Text("Views")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                
                                Text(currentActiveItem.views.stringFormat)
                                    .font(.title3.bold())
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 4)
                            .background {
                                RoundedRectangle(cornerRadius: 6, style: .continuous)
                                    .fill(.white.shadow(.drop(radius: 2)))
                            }
                        }
                }
            }
        }
        .chartYScale(domain: 0...(max + 5000))
        .chartOverlay(content: { proxy in
            GeometryReader { innerProxy in
                Rectangle()
                    .fill(.clear).contentShape(Rectangle())
                    .gesture(
                        DragGesture()
                            .onChanged({ value in
                                let location = value.location
                                
                                if let date: Date = proxy.value(atX: location.x) {
                                    let calendar = Calendar.current
                                    let hour = calendar.component(.hour, from: date)
                                    
                                    if let currentItem = sampleAnalytics.first(where: { item in
                                        calendar.component(.hour, from: item.hour) == hour
                                    }){
                                        self.currentActiveItem = currentItem
                                    }
                                }
                                
                            }).onEnded({ value in
                                self.currentActiveItem = nil
                            })
                    )
            }
        })
        .frame(height: 250)
        .onAppear {
            animatedGraph()
        }
    }
    
    func animatedGraph(fromChange: Bool = false) {
        for (index, _) in sampleAnalytics.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (fromChange ? 0.03 : 0.05)) {
                withAnimation(fromChange ? .easeIn(duration: 0.8) : .interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)) {
                    sampleAnalytics[index].animate = true
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension Double {
    var stringFormat: String {
        if self >= 10000 && self < 999999 {
            return String(format: "%.1fK", self / 10000).replacingOccurrences(of: ".0", with: "")
        }

        if self > 999999 {
            return String(format: "%.1fM", self / 1000000).replacingOccurrences(of: ".0", with: "")
        }
        
        return String(format: "%.0f", self)
    }
}
