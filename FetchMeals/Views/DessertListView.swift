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

    var body: some View {
        NavigationStack {
            List(searchResults) { meal in
                NavigationLink(destination: MealDetailView(mealID: meal.id, mealName: meal.strMeal, viewModel: viewModel)) {
                    MealRowView(meal: meal)
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

