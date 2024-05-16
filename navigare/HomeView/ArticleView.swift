//
//  ArticleView.swift
//  navigare
//
//  Created by Andre Flego on 16.05.2024..
//

import SwiftUI

struct ArticleView: View {
    let article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: "newspaper")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity, alignment: .center)

            Text(article.title)
                .font(.title)
                .bold()
                .padding(.top, 16)

            Text(article.description)
                .font(.system(size: 16))

            Spacer()
        }
        .padding()
        .background(.mint.gradient)
    }
}

#Preview {
    ArticleView(
        article: .init(
            title: "Exploring the Benefits of Mindfulness Meditation",
            description: "Discover how incorporating mindfulness meditation into your daily routine can lead to reduced stress, improved focus, and enhanced overall well-being."
        )
    )
}
