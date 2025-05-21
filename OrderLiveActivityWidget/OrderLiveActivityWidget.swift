import ActivityKit
import WidgetKit
import SwiftUI

struct OrderLiveActivityWidget: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: OrderAttributes.self) { context in
            VStack(alignment: .leading) {
                Text("Durum: \(context.state.status)")
                    .font(.headline)
                Text("Teslimat Zamanı: \(context.state.estimatedDeliveryTime, style: .time)")
                    .font(.caption)
            }
            .padding()
            .activityBackgroundTint(.indigo)
            .activitySystemActionForegroundColor(.white)
        } dynamicIsland: { context in
            DynamicIsland {
                DynamicIslandExpandedRegion(.leading) {
                    Text("Sipariş: \(context.attributes.orderNumber)")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text(context.state.status)
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Tahmini Teslim: \(context.state.estimatedDeliveryTime, style: .relative)")
                }
            } compactLeading: {
                Text("🚴")
            } compactTrailing: {
                Text("⏱")
            } minimal: {
                Text("🍔")
            }
        }
    }
}


