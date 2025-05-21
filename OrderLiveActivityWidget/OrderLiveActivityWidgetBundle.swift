//
//  OrderLiveActivityWidgetBundle.swift
//  OrderLiveActivityWidget
//
//  Created by Mine Kırmacı on 14.05.2025.
//

import WidgetKit
import SwiftUI

@main
struct OrderLiveActivityWidgetBundle: WidgetBundle {
    var body: some Widget {
        OrderLiveActivityWidget()
        OrderLiveActivityWidgetControl()
        OrderLiveActivityWidgetLiveActivity()
    }
}
