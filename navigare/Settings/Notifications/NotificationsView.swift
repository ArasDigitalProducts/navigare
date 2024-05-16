//
//  NotificationsView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct NotificationsView: View {
    @EnvironmentObject private var settingsRouter: Router

    @AppStorage("notificationsEnabled") private var notificationsEnabled = false

    var body: some View {
        VStack(spacing: 16) {
            Toggle("Notifications", isOn: $notificationsEnabled)

            Button("Dismiss") {
                settingsRouter.dismiss()
            }
            .buttonStyle(.borderedProminent)

            Spacer()
        }
        .padding()
    }
}

#Preview {
    NotificationsView()
        .environmentObject(Router())
}
