//
//  ContentView.swift
//  navigare
//
//  Created by Kresimir Levarda on 14.05.2024..
//

import SwiftUI

struct TabBarView: View {
    @StateObject var router1 = Router()
    @StateObject var router2 = Router()
    @StateObject var router3 = Router()
    @State var selection = 1

    var body: some View {
        TabView(selection: $selection) {
            NavigationStack(path: $router1.path) {
                VStack {
                    Text("Hello, home 1!")
                }
                .background(content: {
                    Color.red
                })
                .padding()
                .tag(1)
                .withAppRoutes()
            }

            NavigationStack(path: $router2.path) {
                VStack {
                    Text("Hello, home 2!")
                }
                .background(content: {
                    Color.blue
                })
                .padding()
                .tag(2)
                .withAppRoutes()
            }

            NavigationStack(path: $router3.path) {
                VStack {
                    Text("Hello, home 3!")
                }
                .background(content: {
                    Color.yellow
                })
                .padding()
                .tag(3)
                .withExploreRoutes()
            }
        }
    }
}

struct OnboardingView: View {
    var body: some View {
        VStack {
            Text("Hello, onboarding!")
        }
        .background(content: {
            Color.blue
        })
        .padding()
    }
}

struct AuthView: View {
    var body: some View {
        VStack {
            Text("Hello, auth!")
        }
        .background(content: {
            Color.blue
        })
        .padding()
    }
}
