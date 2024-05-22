//
//  ArticleListItemView.swift
//  navigare
//
//  Created by Andre Flego on 16.05.2024..
//

import SwiftUI

struct ArticleListItemView: View {
    let article: Article

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "newspaper")
                .resizable()
                .frame(width: 48, height: 48)
                .foregroundStyle(.mint.gradient)

            VStack(alignment: .leading, spacing: 8) {
                Text(article.title)
                    .font(.subheadline)
                    .bold()
                    .lineLimit(1)

                Text(article.description)
                    .font(.system(size: 12))
                    .lineLimit(3)
                    .foregroundStyle(.gray)
            }

            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(height: 12)
                .foregroundStyle(.gray)
        }
    }
}


#Preview {
    ArticleListItemView(
        article: Article(
            title: "Exploring the Benefits of Mindfulness Meditation",
            description: "Discover how incorporating mindfulness meditation into your daily routine can lead to reduced stress, improved focus, and enhanced overall well-being."
        )
    )
    .padding()
}
