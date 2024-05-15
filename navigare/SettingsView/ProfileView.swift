//
//  ProfileView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var sessionManager: SessionManager

    var body: some View {
        VStack {
            Text("Logged in as: \(sessionManager.username ?? "nil")")
                .bold()

            Button("Logout") {
                sessionManager.logout()
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(SessionManager())
}
