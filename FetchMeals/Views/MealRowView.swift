//
//  MealRowView.swift
//  FetchMeals
//
//  Created by Marco Abundo on 1/11/25.
//

import SwiftUI

struct MealRowView: View {
    let meal: Meal
    private let cornerRadius = 5.0
    private let size = 50.0

    var body: some View {
        HStack {
            if let urlString = meal.strMealThumb, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .failure:
                        // Indicates an error, show placeholder image
                        PlaceholderImageView(size: size)
                    case .success(let image):
                        image.resizable() // Displays the loaded image.
                            .scaledToFit()
                            .cornerRadius(cornerRadius)
                    default:
                        // Acts as a placeholder.
                        ProgressView()
                    }
                }
                .frame(width: size, height: size)
            } else {
                PlaceholderImageView(size: size)
            }
            Text(meal.strMeal)
        }
    }
}
