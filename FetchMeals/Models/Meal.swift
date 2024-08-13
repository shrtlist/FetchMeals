//
//  Meal.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import Foundation

struct Meal: Identifiable, Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?

    var id: String { idMeal }
}

struct MealListResponse: Codable {
    let meals: [Meal]
}

struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String?
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    // Add more ingredients as needed

    var ingredients: [String] {
        [strIngredient1, strIngredient2, strIngredient3]
            .compactMap { $0 }
            .filter { !$0.isEmpty }
    }
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}
