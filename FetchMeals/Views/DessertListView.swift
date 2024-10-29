//
//  DessertListView.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import SwiftUI

struct DessertListView: View {
    @StateObject private var viewModel = MealViewModel()
    @State private var searchText = ""
    private let widthAndHeight = 50.0
    private let cornerRadius = 5.0

    var body: some View {
        NavigationStack {
            List {
                ForEach(searchResults) { meal in
                    NavigationLink(destination: MealDetailView(mealID: meal.id, mealName: meal.strMeal, viewModel: viewModel)) {
                        HStack {
                            if let urlString = meal.strMealThumb, let url = URL(string: urlString) {
                                AsyncImage(url: url) { phase in
                                    switch phase {
                                    case .failure:
                                        Image(systemName: "birthday.cake.fill") // Indicates an error, show default image
                                            .scaledToFit()
                                            .frame(width: widthAndHeight, height: widthAndHeight)
                                            .cornerRadius(cornerRadius)
                                    case .success(let image):
                                        image.resizable() // Displays the loaded image.
                                            .scaledToFit()
                                            .frame(width: widthAndHeight, height: widthAndHeight)
                                            .cornerRadius(cornerRadius)
                                    default:
                                        // Acts as a placeholder.
                                        ProgressView()
                                    }
                                }
                            }

                            Text(meal.strMeal)
                        }
                    }
                }
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if viewModel.meals.isEmpty {
                    ContentUnavailableView.init("No results", systemImage: "birthday.cake.fill")
                }
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            .navigationTitle("Desserts")
            .task {
                await viewModel.loadDesserts()
            }
            .refreshable {
                await viewModel.loadDesserts()
            }
        }
    }

    var searchResults: [Meal] {
        let meals = viewModel.meals

        if searchText.isEmpty {
            return meals
        } else {
            return meals.filter { $0.strMeal.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

