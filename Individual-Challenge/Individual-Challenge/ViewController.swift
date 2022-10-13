//
//  ViewController.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 10/10/22.
//

import UIKit

class ViewController: UIViewController {
    var recipes: [RecipeInstructionResult]?

    override func viewDidLoad() {
        super.viewDidLoad()
//        API().getAllRecipes(handler: { recipe in
//            self.recipes = recipe
//            print(self.recipes!)
//        })
        
//        API().getRecipeByQuery(query: "pasta", handler: { recipe in
//            self.recipes = recipe
//            print(self.recipes)
//        })
        
        API().getRecipeInstructions(id: 404784, handler: { recipe in
            self.recipes = recipe
            print(self.recipes)
        })
        
//        apiCall.getRecipeByQuery(query: "rice")
//        apiCall.getRecipeInstructions(id: 404784) // {
//            recipes in
//            self.recipes = recipes
//        }
//        apiCall.getSpecificDietRecipe(diet: "vegan")
    }

}
