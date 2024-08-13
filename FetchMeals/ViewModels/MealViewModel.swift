//
//  MealViewModel.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import SwiftUI

@MainActor
class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedMeal: MealDetail?

    private let mealService = MealService()

    func loadDesserts() async {
        do {
            meals = try await mealService.fetchDesserts()
        } catch {
            print("Failed to load meals: \(error.localizedDescription)")
        }
    }

    func loadMealDetail(id: String) async {
        do {
            selectedMeal = try await mealService.fetchMealDetail(id: id)
        } catch {
            print("Failed to load meal detail: \(error.localizedDescription)")
        }
    }
}
