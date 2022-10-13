//
//  ViewController.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 10/10/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let apiCall = API()
//        apiCall.getAllRecipes()
//        apiCall.getRecipeByQuery(query: "rice")
//        apiCall.getRecipeInstructions(id: 404784)
        apiCall.getSpecificDietRecipe(diet: "vegan")
    }

}
