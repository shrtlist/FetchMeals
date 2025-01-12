//
//  DessertListView.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import SwiftUI

struct MealListView: View {
    @State private var viewModel = MealViewModel()
    @State private var searchText = ""

    var body: some View {
        NavigationStack {
            Group {
                if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, alignment: .center)
                } else if viewModel.meals.isEmpty {
                    ScrollView {
                        ContentUnavailableView.init("No results", systemImage: "birthday.cake.fill")
                    }
                } else {
                    List(searchResults) { meal in
                        NavigationLink(destination: MealDetailView(mealID: meal.id, mealName: meal.strMeal, viewModel: viewModel)) {
                            MealRowView(meal: meal)
                        }
                    }
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

