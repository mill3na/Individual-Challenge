//
//  API.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 11/10/22.
//

import Foundation

class API {
    func getAllRecipes() {
        // gets all the recipes from the API
        let url = "https://api.spoonacular.com/recipes/complexSearch"

        makeRequest(url: url, requestType: "getAll")
    }
    func getRecipeByQuery(query: String) {
        // gets all the recipes from the API
        let url = "https://api.spoonacular.com/recipes/complexSearch"
        let queryUrl = "\(url)?query=\(query)"
        makeRequest(url: queryUrl, requestType: "recipeByQuery")
    }
    func getSpecificDietRecipe(diet: String) {
        // searches recipes without some ingredients, depending on the diet
        // supported diets: vegan, vegetarian, lacto-vegetarian, gluten-free, ketogenic (specific rates of fat,
        // protein and carbohydrate), ovo-vegetarian, pescetarian (everything is acceptable except meat-by-products)
        let url = "https://api.spoonacular.com/recipes/complexSearch"
        let queryUrl = "\(url)?diet=\(diet)"
        makeRequest(url: queryUrl, requestType: "recipeByQuery")
    }
    func getRecipeInformations(id: Int, nutricionalValue: Bool = false) {
        let url = "https://api.spoonacular.com/recipes/\(id)/information"
        makeRequest(url: url, requestType: "recipeInformations")
    }
    func getRecipeInstructions(id: Int) {
        let url = "https://api.spoonacular.com/recipes/\(id)/analyzedInstructions"
        print(url)
        makeRequest(url: url, requestType: "recipeInstructions")
    }
    func makeRequest(url: String, requestType: String) {
        // gets all the recipes from the API
        let urlRequest = URL(string: url)
        var request = URLRequest(url: urlRequest!)
        guard urlRequest != nil else {
            print("Error! URL path is invalid. :(")
            return
        }
        let headers = ["x-api-key": "ec2a1601eb7d487b99caee755f56c103"]
        request.allHTTPHeaderFields = headers
        request.httpMethod = "GET"
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request, completionHandler: { (data, _, error) in // _ = reponse
            if error == nil && data != nil {
                do {
                    if requestType == "getAll" || requestType == "recipeByQuery" {
                        let decodedData = try JSONDecoder().decode(RecipeResult.self, from: data!)
                        print(decodedData)
                    } else if requestType == "recipeInformations" {
                        let decodedData = try JSONDecoder().decode(RecipeInformationResults.self, from: data!)
                        print(decodedData)
                    } else if requestType == "recipeInstructions" {
                        let decodedData = try JSONDecoder().decode([RecipeInstructionResult].self, from: data!)
                        print(decodedData)
                    }
                } catch {
                    print("Error parsing response data")
                }
            }
        })
        dataTask.resume()
    }
}
