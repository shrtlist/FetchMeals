//
//  MealService.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import Foundation

class MealService {
    private let baseURL = "https://themealdb.com/api/json/v1/1/"

    func fetchDesserts() async throws -> [Meal] {
        guard let url = URL(string: "\(baseURL)filter.php?c=Dessert") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealListResponse.self, from: data)
        return response.meals.sorted { $0.strMeal < $1.strMeal }
    }

    func fetchMealDetail(id: String) async throws -> MealDetail {
        guard let url = URL(string: "\(baseURL)lookup.php?i=\(id)") else {
            throw URLError(.badURL)
        }

        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        guard let mealDetail = response.meals.first else {
            throw URLError(.cannotDecodeContentData)
        }
        return mealDetail
    }
}
