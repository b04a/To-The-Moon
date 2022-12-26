//
//  SiteView.swift
//  chartTest
//
//  Created by Danil Bochkarev on 24.12.2022.
//

import SwiftUI

struct SiteView: Identifiable {
    var id = UUID().uuidString
    var hour: Date
    var views: Double
    var animate: Bool = false
}

extension Date {
    func updateHour(value: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(bySettingHour: value, minute: 0, second: 0, of: self) ?? .now
    }
}

var sample_analytics: [SiteView] = [
    SiteView(hour: Date().updateHour(value: 8), views: 1500),
    SiteView(hour: Date().updateHour(value: 9), views: 2354),
    SiteView(hour: Date().updateHour(value: 10), views: 3423),
    SiteView(hour: Date().updateHour(value: 11), views: 6456),
    SiteView(hour: Date().updateHour(value: 12), views: 3454),
    SiteView(hour: Date().updateHour(value: 13), views: 7456),
    SiteView(hour: Date().updateHour(value: 14), views: 8346),
    SiteView(hour: Date().updateHour(value: 15), views: 5543),
    SiteView(hour: Date().updateHour(value: 16), views: 1657),
    SiteView(hour: Date().updateHour(value: 17), views: 8753),
    SiteView(hour: Date().updateHour(value: 18), views: 8473),
    SiteView(hour: Date().updateHour(value: 19), views: 5264),
    SiteView(hour: Date().updateHour(value: 20), views: 4204),
]

