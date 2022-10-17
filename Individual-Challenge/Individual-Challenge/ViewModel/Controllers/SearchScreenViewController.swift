//
//  SearchScreenViewController.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 14/10/22.
//

import UIKit

class SearchScreenViewController: UIViewController {
    var screen: SearchScreenView?
    
    private let veganFood: VeganFoodViewController = {
        let veganView = VeganFoodViewController()
        veganView.view.translatesAutoresizingMaskIntoConstraints = false
        return veganView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationbarItems()
        view.addSubview(veganFood.view)
        self.setUpConstraints()
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
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.veganFood.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 100),
            self.veganFood.view.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            //self.veganFood.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -5)
        ])
    }
    
    private func configureNavigationbarItems() {
        navigationItem.title = "Search Recipe"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
    }
    
    @objc func presentVeganFood() {
//   self.veganFood.view.isHidden = false
//        self.view.sendSubviewToBack(self.screen!)
//        self.view.bringSubviewToFront(self.veganFood.view)
//
        let veganVC = VeganFoodViewController()
//        let navigationControler = UINavigationController(rootViewController: veganVC)
        if let sheet = veganVC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        present(veganVC, animated: true, completion: nil)
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
