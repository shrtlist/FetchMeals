//
//  DessertListView.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import SwiftUI

struct DessertListView: View {
    @StateObject private var viewModel = MealViewModel()

    var body: some View {
        NavigationStack {
            List(viewModel.meals) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.id, mealName: meal.strMeal, viewModel: viewModel)) {
                    HStack {
                        if let urlString = meal.strMealThumb, let url = URL(string: urlString) {
                            AsyncImage(url: url) { phase in
                                if let image = phase.image {
                                    image.resizable() // Displays the loaded image.
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(5)
                                } else if phase.error != nil {
                                    Image(systemName: "birthday.cake.fill") // Indicates an error, show default image
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(5)
                                } else {
                                    // Acts as a placeholder.
                                    ProgressView()
                                }
                            }
                        }

                        Text(meal.strMeal)
                    }
                }
            }
            .navigationTitle("Desserts")
            .task {
                await viewModel.loadDesserts()
            }
        }
    }
}

