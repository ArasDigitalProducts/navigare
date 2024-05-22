//
//  HomeView.swift
//  navigare
//
//  Created by Andre Flego on 15.05.2024..
//

import SwiftUI

let articles: [Article] = [
    .init(
        id: "1",
        title: "Exploring the Benefits of Mindfulness Meditation",
        description: "Discover how incorporating mindfulness meditation into your daily routine can lead to reduced stress, improved focus, and enhanced overall well-being."
    ),
    .init(
        id: "2",
        title: "The Rise of Plant-Based Diets: A Comprehensive Guide",
        description: "Learn about the growing popularity of plant-based diets, their potential health benefits, and how to make the transition to a more plant-focused lifestyle."
    ),
    .init(
        id: "3",
        title: "Unraveling the Mysteries of Dark Matter in the Universe",
        description: "Delve into the fascinating world of dark matter, its role in shaping the cosmos, and the ongoing efforts of scientists to understand this enigmatic substance."
    ),
    .init(
        id: "4",
        title: "Empowering Women in STEM: Breaking Barriers and Driving Innovation",
        description: "Explore the strides being made to support and encourage women in science, technology, engineering, and mathematics (STEM) fields, and the transformative impact they’re having on the world."
    ),
    .init(
        id: "5",
        title: "The Art of Effective Communication: Strategies for Building Stronger Relationships",
        description: "Gain insights into the key principles of communication, learn practical techniques for enhancing interpersonal connections, and unlock the secrets to fostering healthier and more fulfilling relationships."
    ),
    .init(
        id: "6",
        title: "The Future of Renewable Energy: Trends and Innovations Shaping Tomorrow’s Power Landscape",
        description: "Discover the latest advancements in renewable energy technologies, from solar and wind to hydro and geothermal, and their potential to revolutionize global energy production."
    ),
    .init(
        id: "7",
        title: "Navigating the Gig Economy: Tips for Freelancers and Independent Contractors",
        description: "Learn how to thrive in the fast-paced world of the gig economy, with practical advice on finding clients, managing finances, and maintaining work-life balance."
    ),
    .init(
        id: "8",
        title: "The Psychology of Procrastination: Understanding the Causes and Overcoming Productivity Pitfalls",
        description: "Explore the underlying reasons behind procrastination, strategies for combating it, and techniques for boosting motivation and productivity."
    ),
    .init(
        id: "9",
        title: "The Impact of Artificial Intelligence on Healthcare: Revolutionizing Patient Care and Diagnosis",
        description: "Examine the transformative potential of AI in healthcare, from personalized treatment plans and early disease detection to streamlining administrative tasks and improving medical outcomes."
    ),
    .init(
        id: "10",
        title: "Mastering the Art of Resilience: Building Mental Toughness in the Face of Adversity",
        description: "Discover the traits and habits of resilient individuals, and learn how to cultivate resilience in your own life to better navigate challenges and setbacks."
    )
]

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator

    var body: some View {
        List(articles) { article in
            Button {
                coordinator.push(to: HomePushDestination.details(article))
            } label: {
                ArticleListItemView(article: article)
            }
            .buttonStyle(.plain)
        }
        .navigationTitle("Home")
        .toolbar {
            Button {
                coordinator.push(to: HomeCoordinatorDestination.search)
            } label: {
                Image(systemName: "magnifyingglass")
            }
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(Coordinator())
}
