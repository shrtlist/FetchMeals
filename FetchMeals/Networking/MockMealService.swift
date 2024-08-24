//
//  MockMealService.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/23/24.
//

import Foundation

final class MockMealService: MealServiceProtocol {
    func fetchDesserts() async throws -> [Meal] {
        return [Meal(idMeal: "52966", strMeal: "Creme brulee", strMealThumb: nil)]
    }

    func fetchMealDetail(id: String) async throws -> MealDetail {
        return MealDetail(idMeal: "52966", strMeal: "Creme brulee", strInstructions: "Mixit", strMealThumb: "url", strIngredient1: nil, strIngredient2: nil, strIngredient3: nil, strIngredient4: nil, strIngredient5: nil, strIngredient6: nil, strIngredient7: nil, strIngredient8: nil, strIngredient9: nil, strIngredient10: nil, strIngredient11: nil, strIngredient12: nil, strIngredient13: nil, strIngredient14: nil, strIngredient15: nil, strIngredient16: nil, strIngredient17: nil, strIngredient18: nil, strIngredient19: nil, strIngredient20: nil, strMeasure1: nil, strMeasure2: nil, strMeasure3: nil, strMeasure4: nil, strMeasure5: nil, strMeasure6: nil, strMeasure7: nil, strMeasure8: nil, strMeasure9: nil, strMeasure10: nil, strMeasure11: nil, strMeasure12: nil, strMeasure13: nil, strMeasure14: nil, strMeasure15: nil, strMeasure16: nil, strMeasure17: nil, strMeasure18: nil, strMeasure19: nil, strMeasure20: nil)
    }
}
