//
//  MealDetailView.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import SwiftUI

struct MealDetailView: View {
    let mealID: String
    let mealName: String
    private let height = 200.0
    private let cornerRadius = 10.0
    @ObservedObject var viewModel: MealViewModel

    var body: some View {
        ScrollView { // Wrap the content in a ScrollView
            VStack(alignment: .leading) { // Align content to the leading edge
                if let meal = viewModel.selectedMeal {
                    let url = URL(string: meal.strMealThumb)
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .failure:
                            Image(systemName: "birthday.cake.fill") // Indicates an error, show default image
                                .scaledToFit()
                                .frame(height: height)
                                .cornerRadius(cornerRadius)
                        case .success(let image):
                            image.resizable() // Displays the loaded image.
                                .scaledToFit()
                                .frame(height: height)
                                .cornerRadius(cornerRadius)
                        default:
                            // Acts as a placeholder.
                            ProgressView()
                        }
                    }

                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.top)

                    ForEach(meal.ingredientsWithMeasurements, id: \.self) { ingredient in
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
        .navigationTitle(mealName)
        .task {
            await viewModel.loadMealDetail(id: mealID)
        }
    }
}
