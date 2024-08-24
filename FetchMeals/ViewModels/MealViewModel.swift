//
//  MealViewModel.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/12/24.
//

import SwiftUI

@MainActor
final class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedMeal: MealDetail?
    @Published var isLoading = false
    private let mealService: MealServiceProtocol

    init(mealService: MealServiceProtocol = MealService()) {
        self.mealService = mealService
    }

    func loadDesserts() async {
        guard !isLoading else { return }
        isLoading = true

        do {
            meals = try await mealService.fetchDesserts()
        } catch {
            print("Failed to load meals: \(error.localizedDescription)")
        }

        isLoading = false
    }

    func loadMealDetail(id: String) async {
        do {
            selectedMeal = try await mealService.fetchMealDetail(id: id)
        } catch {
            print("Failed to load meal detail: \(error.localizedDescription)")
        }
    }
}
