//
//  Results.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 11/10/22.
//

import Foundation

struct RecipeResult: Decodable {
    let offset: Int
    let number: Int
    let totalResults: Int
    let results: [Recipe]
}

struct RecipeInformationResult: Decodable {
    let id: Int
    let title: String
    let readyInMinutes: Int
    let image: String
    let imageType: String
    let summary: String
    let cuisines: [String]?
    let diets: [String]
}

struct RecipeInstructionResult: Decodable {
    let steps: [Steps]
}

struct Steps: Decodable {
    let number: Int
    let step: String
    let ingredients: [Ingredients]
}

struct Ingredients: Decodable {
    let id: Int
    let name: String
    let localizedName: String
    let image: String
}
