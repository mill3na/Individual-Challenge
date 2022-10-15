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
}
