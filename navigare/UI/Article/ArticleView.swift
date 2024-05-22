//
//  ArticleView.swift
//  navigare
//
//  Created by Andre Flego on 16.05.2024..
//

import SwiftUI
import UIKit

struct ArticleView: View {
    @StateObject private var viewModel: ArticleViewModel

    init(_ viewModel: @escaping () -> ArticleViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel())
    }

    @State private var showAlert = false

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "newspaper")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .center)

            Text(viewModel.article.title)
                .font(.title)
                .bold()
                .padding(.top, 16)

            Text(viewModel.article.description)
                .font(.system(size: 16))

            Spacer()

            Button("Web article") {
                viewModel.presentWebArticle()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .center)

            Spacer()
        }
        .padding()
        .background(.mint.gradient)
        .sheet(item: $viewModel.sheet, onDismiss: viewModel.dismiss) { sheet in
            switch sheet {
            case .webArticle:
                Text("Web view")
            }
        }


        .customBackButton(action: {
            showAlert = true
        })
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Confirmation"),
                message: Text("Do you want to go back?"),
                primaryButton: .default(Text("Yes")) {
                    viewModel.goBack()
                },
                secondaryButton: .cancel()
            )
        }
    }
}

#Preview {
    ArticleView {
        ArticleViewModel(
            article: Article(
                title: "Exploring the Benefits of Mindfulness Meditation",
                description: "Discover how incorporating mindfulness meditation into your daily routine can lead to reduced stress, improved focus, and enhanced overall well-being."
            ),
            coordinator: Coordinator()
        )
    }
}
