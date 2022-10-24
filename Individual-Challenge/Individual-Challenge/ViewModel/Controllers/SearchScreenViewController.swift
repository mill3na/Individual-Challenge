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
        self.screen?.searchButton.addTarget(self, action: #selector(searchFood), for: .touchUpInside)
    
    }
    
    private func configureNavigationbarItems() {
        navigationItem.title = "Search Recipe"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
    }
    @objc func searchFood() {
        
        let query =  self.screen?.searchBar.text
        if let query {
            API().getRecipeByQuery(query: query, handler: { recipe in
                self.recipes = recipe
                DispatchQueue.main.async {
                    self.presentSearchRecipe()
                }
            })
        }
    }
    
    func presentSearchRecipe() {
        let veganVC = RecipesCollectionViewController()
        if let recipes {
            veganVC.numberOfCells = recipes.results.count
            veganVC.recipes = self.recipes!
            print()
        }
        if let sheet = veganVC.sheetPresentationController {
            sheet.detents = [.large()]
        }
        
        veganVC.modalPresentationStyle = .formSheet
        present(veganVC, animated: true, completion: nil)
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
