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
                            AsyncImage(url: url) { image in
                                image.resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(5)
                            } placeholder: {
                                ProgressView()
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

