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
    @State private var isSheetVisible = false

    var body: some View {
        VStack {
            Toggle("Notifications", isOn: $notificationsEnabled)
            Button("Sheet") {
                isSheetVisible = true
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NotificationsView()
        .environmentObject(Router())
}
