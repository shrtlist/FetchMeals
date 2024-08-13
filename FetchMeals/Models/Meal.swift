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
