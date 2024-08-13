//
//  MealDetailView.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    @ObservedObject var viewModel: MealViewModel

    var body: some View {
        ScrollView { // Wrap the content in a ScrollView
            VStack(alignment: .leading) { // Align content to the leading edge
                if let meal = viewModel.selectedMeal {
                    Text(meal.strMeal)
                        .font(.largeTitle)
                        .padding()

                    if let urlString = meal.strMealThumb, let url = URL(string: urlString) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                    }

                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.top)

                    ForEach(meal.ingredients, id: \.self) { ingredient in
                        Text(ingredient)
                    }

                    Text("Instructions:")
                        .font(.headline)
                        .padding(.top)

                    Text(meal.strInstructions)
                        .padding(.trailing)
                        .lineLimit(nil) // Allow unlimited lines
                        .fixedSize(horizontal: false, vertical: true) // Prevent truncation by allowing the text to wrap

                } else {
                    ProgressView("Loading...")
                }
            }
            .padding()
        }
        .navigationTitle("Meal Details")
        .task {
            await viewModel.loadMealDetail(id: mealID)
        }
    }
}
