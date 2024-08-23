//
//  Meal.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import Foundation

struct Meal: Identifiable, Decodable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?

    var id: String { idMeal }
}

struct MealListResponse: Decodable {
    let meals: [Meal]
}
