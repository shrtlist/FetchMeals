//
//  MealServiceProtocol.swift
//  FetchMeals
//
//  Created by Marco Abundo on 8/23/24.
//

import Foundation

protocol MealServiceProtocol: AnyObject {
    func fetchDesserts() async throws -> [Meal]
    func fetchMealDetail(id: String) async throws -> MealDetail
}
