//
//  AuthView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct AuthView: View {
    var body: some View {
        VStack {
            Text("Auth view!")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.green)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    AuthView()
}
