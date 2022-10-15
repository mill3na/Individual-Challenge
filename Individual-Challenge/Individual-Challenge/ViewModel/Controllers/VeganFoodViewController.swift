//
//  VeganFoodViewController.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 15/10/22.
//

import UIKit

class VeganFoodViewController: UIViewController {

    var screen: VeganFoodView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen = VeganFoodView()
        self.view = screen
        view.backgroundColor = .blue
        // Do any additional setup after loading the view.
    }
    
    func configureNavigationBarItems() {
        navigationItem.title = "Search Recipe"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: nil)
    }
}
