//
//  ContentView.swift
//  LiveActivityOrderDemo
//
//  Created by Mine Kırmacı on 14.05.2025.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    @State private var activity: Activity<OrderAttributes>? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("Sipariş Takip Uygulaması")
                .font(.title)

            Button("Siparişi Başlat") {
                startLiveActivity()
            }

            Button("Siparişi Güncelle") {
                updateLiveActivity()
            }

            Button("Siparişi Sonlandır") {
                endLiveActivity()
            }
        }
        .padding()
    }

    func startLiveActivity() {
        let attributes = OrderAttributes(orderNumber: "1234")
        let initialState = OrderAttributes.ContentState(
            status: "Kurye yola çıktı",
            estimatedDeliveryTime: Date().addingTimeInterval(1800)
        )

        do {
            let newActivity = try Activity<OrderAttributes>.request(
                attributes: attributes,
                content: .init(state: initialState, staleDate: nil),
                pushType: nil
            )
            self.activity = newActivity
            print("Live Activity başlatıldı: \(newActivity.id)")
        } catch {
            print("Live Activity başlatılamadı: \(error.localizedDescription)")
        }
    }

    func updateLiveActivity() {
        guard let activity else { return }

        Task {
            let updatedState = OrderAttributes.ContentState(
                status: "Sipariş kapında!",
                estimatedDeliveryTime: Date().addingTimeInterval(300)
            )

            await activity.update(using: updatedState)
            print("Live Activity güncellendi.")
        }
    }

    func endLiveActivity() {
        guard let activity else { return }

        Task {
            let finalState = OrderAttributes.ContentState(
                status: "Teslim edildi ✅",
                estimatedDeliveryTime: Date()
            )

            await activity.end(using: finalState, dismissalPolicy: .immediate)
            print("Live Activity sonlandırıldı.")
        }
    }
}
#Preview {
    ContentView()
}
