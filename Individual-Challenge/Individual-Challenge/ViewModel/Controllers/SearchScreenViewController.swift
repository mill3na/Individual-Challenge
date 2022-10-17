//
//  SearchScreenViewController.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 14/10/22.
//

import UIKit

class SearchScreenViewController: UIViewController {
    var screen: SearchScreenView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationbarItems()
    }
    
    override func loadView() {
        self.screen = SearchScreenView()
        self.view = screen
        view.backgroundColor = .systemBackground
        self.screen?.veganFoodButton.addTarget(self, action: #selector(presentVeganFood), for: .touchUpInside)
        self.screen?.glutenFreeButton.addTarget(self, action: #selector(presentGlutenFreeFood), for: .touchUpInside)
        self.screen?.dairyFreeButton.addTarget(self, action: #selector(presentDairyFreeFood), for: .touchUpInside)
        self.screen?.ketogenicButton.addTarget(self, action: #selector(presentKetogenicFood), for: .touchUpInside)
    }
    
    private func configureNavigationbarItems() {
        navigationItem.title = "Search Recipe"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
    }
    
    @objc func presentVeganFood() {
        let veganVC = VeganFoodViewController()
        let navigationControler = UINavigationController(rootViewController: veganVC)
        navigationControler.modalPresentationStyle = .formSheet
        present(navigationControler, animated: true, completion: nil)
    }
    
    @objc func presentGlutenFreeFood () {
        print("Gluten Free!")
    }
    
    @objc func presentDairyFreeFood() {
        print("Dairy free!")
    }
    
    @objc func presentKetogenicFood() {
        print("Ketogenic!")
    }
}
