//
//  API.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 11/10/22.
//

import Foundation

class API {
    func getAllRecipes(handler: @escaping (RecipeResult?) -> Void) {
        // gets all the recipes from the API
        let url = "https://api.spoonacular.com/recipes/complexSearch"
        getGeneralRecipeRequest(url: url, requestType: "getAll", completion: handler)
    }
    
    func getRecipeByQuery(query: String, handler: @escaping (RecipeResult?) -> Void) {
        // gets all the recipes from the API
        let url = "https://api.spoonacular.com/recipes/complexSearch"
        let queryUrl = "\(url)?query=\(query)"
        getGeneralRecipeRequest(url: queryUrl, requestType: "recipeByQuery", completion: handler)
    }
    
    func getSpecificDietRecipe(diet: String, handler: @escaping (RecipeResult?) -> Void) {
        // searches recipes without some ingredients, depending on the diet
        // supported diets: vegan, vegetarian, lacto-vegetarian, gluten-free, ketogenic (specific rates of fat,
        // protein and carbohydrate), ovo-vegetarian, pescetarian (everything is acceptable except meat-by-products)
        let url = "https://api.spoonacular.com/recipes/complexSearch"
        let queryUrl = "\(url)?diet=\(diet)"
        getGeneralRecipeRequest(url: queryUrl, requestType: "recipeByQuery", completion: handler)
    }
    
    func getRecipeInformations(id: Int, nutricionalValue: Bool = false, handler: @escaping (RecipeInformationResult?) -> Void) {
        let url = "https://api.spoonacular.com/recipes/\(id)/information"
        getRecipeInfoRequest(url: url, completion: handler)
    }
    
    func getRecipeInstructions(id: Int, handler: @escaping ([RecipeInstructionResult]?) -> Void) {
        let url = "https://api.spoonacular.com/recipes/\(id)/analyzedInstructions"
        getRecipeInstructionsRequest(url: url, completion: handler)
    }
    
    func getGeneralRecipeRequest(url: String, requestType: String, completion: @escaping ((RecipeResult?) -> Void)) {
        
        // completion devia ser Result type Result<RecipeResult, Error>
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
            // if let / guard let
            if let data {
                if error == nil {
                    do {
                        let decodedData = try JSONDecoder().decode(RecipeResult.self, from: data)
                        completion(decodedData)
                        return

                    } catch {
                        completion(nil)
                        print("Error parsing response data")
                    }
                }
            }
            completion(nil)
        })
        dataTask.resume()
    }
    
    func getRecipeInfoRequest(url: String, completion: @escaping ((RecipeInformationResult?) -> Void)) {
        
        // completion devia ser Result type Result<RecipeResult, Error>
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
            // if let / guard let
            if let data {
                if error == nil {
                    do {
                        let decodedData = try JSONDecoder().decode(RecipeInformationResult.self, from: data)
                        completion(decodedData)
                        return

                    } catch {
                        completion(nil)
                        print("Error parsing response data")
                    }
                }
            }
            completion(nil)
        })
        dataTask.resume()
    }
    
    func getRecipeInstructionsRequest(url: String, completion: @escaping (([RecipeInstructionResult]?) -> Void)) {
        
        // completion devia ser Result type Result<RecipeResult, Error>
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
            // if let / guard let
            if let data {
                if error == nil {
                    do {
                        let decodedData = try JSONDecoder().decode([RecipeInstructionResult].self, from: data)
                        completion(decodedData)
                        return

                    } catch {
                        completion(nil)
                        print("Error parsing response data")
                    }
                }
            }
            completion(nil)
        })
        dataTask.resume()
    }
}
