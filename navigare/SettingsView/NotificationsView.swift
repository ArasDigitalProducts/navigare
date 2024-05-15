//
//  NotificationsView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct NotificationsView: View {
    @AppStorage("notificationsEnabled") private var notificationsEnabled = false
    
    var body: some View {
        VStack {
            Toggle("Notifications", isOn: $notificationsEnabled)
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NotificationsView()
}
