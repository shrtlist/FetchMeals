//
//  FetchMealsTests.swift
//  FetchMealsTests
//
//  Created by Marco Abundo on 8/12/24.
//

import XCTest
@testable import FetchMeals

final class FetchMealsTests: XCTestCase {

    @MainActor func testfetchDesserts() async {
        let mockMealService = MockMealService()
        let sut = MealViewModel(mealService: mockMealService)

        await sut.loadDesserts()

        XCTAssertTrue(sut.meals.count > 0)
    }

    @MainActor func testfetchMealDetail() async {
        let idMeal = "52966"

        let mockMealService = MockMealService()
        let sut = MealViewModel(mealService: mockMealService)

        await sut.loadMealDetail(id: idMeal)

        XCTAssertEqual(sut.selectedMeal?.idMeal, idMeal)
        XCTAssertNotNil(sut.selectedMeal?.strMeal)
        XCTAssertNotNil(sut.selectedMeal?.strInstructions)
        XCTAssertNotNil(sut.selectedMeal?.strMealThumb)
        XCTAssertNotNil(sut.selectedMeal?.ingredientsWithMeasurements)
    }
}
