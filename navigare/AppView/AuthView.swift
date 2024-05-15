//
//  AuthView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct AuthView: View {
    @EnvironmentObject private var sessionManager: SessionManager

    @State private var username = ""

    var body: some View {
        VStack {
            TextField("username", text: $username)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Login") {
                sessionManager.login(username: username)
            }
            .disabled(username.isEmpty)
            .buttonStyle(.borderedProminent)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(Color.green)
        .ignoresSafeArea()
    }
}

#Preview {
    AuthView()
        .environmentObject(SessionManager())
}
