//
//  OrderAttributes.swift
//  LiveActivityOrderDemo
//
//  Created by Mine Kırmacı on 14.05.2025.
//

import ActivityKit
import Foundation

struct OrderAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var status: String
        var estimatedDeliveryTime: Date
    }

    var orderNumber: String
}
