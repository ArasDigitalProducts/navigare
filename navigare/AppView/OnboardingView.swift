//
//  OnboardingView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Text("Onboarding")
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .background(Color.blue)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    OnboardingView()
}
