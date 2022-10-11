//
//  API.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 11/10/22.
//

import Foundation

class API {
    var url = "https://api.spoonacular.com/recipes/complexSearch"
    func getAllRecipes() {
        // gets all the recipes from the API
        makeRequest(url: url)
    }
    func getRecipeByQuery(query: String) {
        // gets all the recipes from the API
        let queryUrl = "\(url)?query=\(query)"
        makeRequest(url: queryUrl)
    }
    func makeRequest(url: String) {
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
                    let dictionary = try JSONSerialization.jsonObject(with: data!) as? [String: Any]
                    print(dictionary!)
                } catch {
                    print("Error parsing response data")
                }
            }
        })
        dataTask.resume()
    }
    func getRecipeInformations(id: Int, nutricionalValue: Bool = false) {
        let url = "https://api.spoonacular.com/recipes/\(id)/information?includeNutrition=\(nutricionalValue)"
        makeRequest(url: url)
    }
    
    func getRecipeInstructions(id: Int) {
        let url = "https://api.spoonacular.com/recipes/\(id)/analyzedInstructions"
        makeRequest(url: url)
    }
}
