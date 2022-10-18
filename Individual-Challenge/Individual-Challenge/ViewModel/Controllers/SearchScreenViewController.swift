//
//  SearchScreenViewController.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 14/10/22.
//

import UIKit

class SearchScreenViewController: UIViewController {
    var screen: SearchScreenView?
    var recipes: RecipeResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationbarItems()
        hideKeyboardWhenTappedAround()
    }
    
    override func loadView() {
        self.screen = SearchScreenView()
        self.view = screen
        view.backgroundColor = .systemBackground
        self.screen?.veganFoodButton.addTarget(self, action: #selector(presentVeganFood), for: .touchUpInside)
        self.screen?.glutenFreeButton.addTarget(self, action: #selector(presentGlutenFreeFood), for: .touchUpInside)
        self.screen?.dairyFreeButton.addTarget(self, action: #selector(presentDairyFreeFood), for: .touchUpInside)
        
        Task {
            API().getRecipeByQuery(query: "pasta", handler: { recipe in
                self.recipes = recipe
                if let queryRecipes = self.recipes {
                    print("Number of recipes \(queryRecipes.results.count)")
                }
            })
        }
    }
    
    private func configureNavigationbarItems() {
        navigationItem.title = "Search Recipe"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
    }
    
    @objc func presentVeganFood() {
        let veganVC = RecipesCollectionViewController()
        if let recipes {
            veganVC.numberOfCells = recipes.results.count
            veganVC.recipes = self.recipes!
            
        }
        if let sheet = veganVC.sheetPresentationController {
            sheet.detents = [.large()]
        }
        
        veganVC.modalPresentationStyle = .formSheet
        present(veganVC, animated: true, completion: nil)
    }
    
    @objc func presentGlutenFreeFood () {
        let glutenFreeVC = GlutenFreeViewController()
        if let sheet = glutenFreeVC.sheetPresentationController {
                sheet.detents = [.medium()]
            
        }
        glutenFreeVC.modalPresentationStyle = .overCurrentContext
        glutenFreeVC.modalTransitionStyle = .crossDissolve
        present(glutenFreeVC, animated: true, completion: nil)
        print("Gluten Free!")
    }
    
    @objc func presentDairyFreeFood() {
        let dairyFreeVC = DairyFreeViewController()
        if let sheet = dairyFreeVC.sheetPresentationController {
                sheet.detents = [.medium()]
            
        }
        dairyFreeVC.modalPresentationStyle = .overCurrentContext
        dairyFreeVC.modalTransitionStyle = .crossDissolve
        present(dairyFreeVC, animated: true, completion: nil)
        print("Dairy free!")
    }
}

extension UIViewController {

    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard(_:)))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)

        if let nav = self.navigationController {
            nav.view.endEditing(true)
        }
    }
 }
