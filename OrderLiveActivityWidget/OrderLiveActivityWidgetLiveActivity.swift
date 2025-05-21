//
//  OrderLiveActivityWidgetLiveActivity.swift
//  OrderLiveActivityWidget
//
//  Created by Mine Kırmacı on 14.05.2025.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct OrderLiveActivityWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct OrderLiveActivityWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: OrderLiveActivityWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension OrderLiveActivityWidgetAttributes {
    fileprivate static var preview: OrderLiveActivityWidgetAttributes {
        OrderLiveActivityWidgetAttributes(name: "World")
    }
}

extension OrderLiveActivityWidgetAttributes.ContentState {
    fileprivate static var smiley: OrderLiveActivityWidgetAttributes.ContentState {
        OrderLiveActivityWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: OrderLiveActivityWidgetAttributes.ContentState {
         OrderLiveActivityWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: OrderLiveActivityWidgetAttributes.preview) {
   OrderLiveActivityWidgetLiveActivity()
} contentStates: {
    OrderLiveActivityWidgetAttributes.ContentState.smiley
    OrderLiveActivityWidgetAttributes.ContentState.starEyes
}
