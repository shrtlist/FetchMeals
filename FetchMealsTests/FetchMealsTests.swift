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
        let sut = MealViewModel()

        await sut.loadDesserts()

        XCTAssertTrue(sut.meals.count > 0)
    }

    @MainActor func testfetchMealDetail() async {
        let idMeal = "52966"

        let sut = MealViewModel()

        await sut.loadMealDetail(id: idMeal)

        XCTAssertEqual(sut.selectedMeal?.idMeal, idMeal)
        XCTAssertNotNil(sut.selectedMeal?.strMeal)
        XCTAssertNotNil(sut.selectedMeal?.strInstructions)
        XCTAssertNotNil(sut.selectedMeal?.strMealThumb)
        XCTAssertNotNil(sut.selectedMeal?.ingredientsWithMeasurements)
    }
}
