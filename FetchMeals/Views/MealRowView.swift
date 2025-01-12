//
//  MealRowView.swift
//  FetchMeals
//
//  Created by Marco Abundo on 1/11/25.
//

import SwiftUI

struct MealRowView: View {
    var meal: Meal
    private let cornerRadius = 5.0
    private let size = 50.0

    var body: some View {
        HStack {
            if let urlString = meal.strMealThumb, let url = URL(string: urlString) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .failure:
                        Image(systemName: "birthday.cake.fill") // Indicates an error, show default image
                            .scaledToFit()
                            .frame(width: size, height: size)
                            .cornerRadius(cornerRadius)
                    case .success(let image):
                        image.resizable() // Displays the loaded image.
                            .scaledToFit()
                            .frame(width: size, height: size)
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
