//
//  SearchScreenView.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 14/10/22.
//

import UIKit

protocol VeganFoodDelegate: AnyObject {
    func presentVeganFood()
}

class SearchScreenView: UIView {
    
    let dietButtonsTextSize = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(welcomeLabel)
        self.welcomeLabelConfigConstraints()
        
        self.addSubview(searchBar)
        self.searchbarConfigConstraints()
        
        self.addSubview(veganFoodButton)
        self.veganFoodButtonConfigConstraints()
        
        self.addSubview(glutenFreeButton)
        self.glutenFreeButtonConfigConstraints()
        
        self.addSubview(dairyFreeButton)
        self.dairyFreeButtonConfigConstraints()
        
        self.addSubview(ketogenicButton)
        self.ketogenicButtonConfigConstraints()
        
        self.addSubview(foodImage)
        self.gifImageConfigConstraints()

        self.addSubview(cookLabel)
        self.searchLabelConfigConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let welcomeLabel: UILabel = {
        var welcomeLabel = UILabel()
        welcomeLabel.text = "Welcome! Type something in the search bar to begin."
        welcomeLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        welcomeLabel.numberOfLines = 0
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        return welcomeLabel
    }()
    
    let searchBar: UISearchBar = {
        var searchBar = UISearchBar()
        searchBar.placeholder = "Search recipe"
        searchBar.tintColor = UIColor(named: "PrimaryColor2")
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let veganFoodButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Vegan", for: .normal)
        button.backgroundColor = UIColor(named: "SecondGreen")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitleColor(UIColor(named: "PrimaryColor2"), for: .normal)
        button.layer.shadowColor = UIColor(named: "ThirdGreen")?.cgColor
        button.layer.shadowOffset = CGSize(width: 1.5, height: 3)
        button.layer.shadowOpacity = 0.6
        button.layer.shadowRadius = 1.5
        button.layer.cornerRadius = 9
        button.addTarget(self, action: #selector(presentVeganFood), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc func presentVeganFood() {
        
    }
    
    let glutenFreeButton: UIButton = {
        let glutenFree = UIButton()
        glutenFree.backgroundColor = .gray
        glutenFree.setTitle("Gluten free diet", for: .normal)
        glutenFree.backgroundColor = UIColor(named: "SecondGreen")
        glutenFree.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        glutenFree.setTitleColor(UIColor(named: "PrimaryColor2"), for: .normal)
        glutenFree.layer.shadowColor = UIColor(named: "ThirdGreen")?.cgColor
        glutenFree.layer.shadowOffset = CGSize(width: 1.5, height: 3)
        glutenFree.layer.shadowOpacity = 0.6
        glutenFree.layer.shadowRadius = 1.5
        glutenFree.layer.cornerRadius = 9
        glutenFree.titleLabel?.numberOfLines = 0
        glutenFree.titleLabel?.textAlignment = .center
        glutenFree.translatesAutoresizingMaskIntoConstraints = false
        return glutenFree
    }()

    let dairyFreeButton: UIButton = {
        let dairyFree = UIButton()
        dairyFree.backgroundColor = .gray
        dairyFree.setTitle("Dairy free diet", for: .normal)
        dairyFree.backgroundColor = UIColor(named: "SecondGreen")
        dairyFree.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        dairyFree.setTitleColor(UIColor(named: "PrimaryColor2"), for: .normal)
        dairyFree.layer.shadowColor = UIColor(named: "ThirdGreen")?.cgColor
        dairyFree.layer.shadowOffset = CGSize(width: 1.5, height: 3)
        dairyFree.layer.shadowOpacity = 0.6
        dairyFree.layer.shadowRadius = 1.5
        dairyFree.layer.cornerRadius = 9
        dairyFree.translatesAutoresizingMaskIntoConstraints = false
        dairyFree.titleLabel?.numberOfLines = 0
        dairyFree.titleLabel?.textAlignment = NSTextAlignment.center
        
        return dairyFree
    }()

    let ketogenicButton: UIButton = {
        let ketogenic = UIButton()
        ketogenic.backgroundColor = .gray
        ketogenic.setTitle("Keto- genic", for: .normal)
        ketogenic.backgroundColor = UIColor(named: "SecondGreen")
        ketogenic.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        ketogenic.setTitleColor(UIColor(named: "PrimaryColor2"), for: .normal)
        ketogenic.layer.shadowColor = UIColor(named: "ThirdGreen")?.cgColor
        ketogenic.layer.shadowOffset = CGSize(width: 1.5, height: 3)
        ketogenic.layer.shadowOpacity = 0.6
        ketogenic.layer.shadowRadius = 1.5
        ketogenic.layer.cornerRadius = 9
        ketogenic.titleLabel?.numberOfLines = 0
        ketogenic.titleLabel?.textAlignment = NSTextAlignment.center
        ketogenic.translatesAutoresizingMaskIntoConstraints = false
        return ketogenic
    }()
    
    let foodImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage.gifImageWithName("food")
        image.contentMode = .scaleAspectFit
        image.frame = CGRect(x: 60, y: 253, width: 255, height: 230)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let cookLabel: UILabel = {
        var cookLabel = UILabel()
        cookLabel.text = "What are we going to cook?"
        cookLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        cookLabel.textColor = .black
        cookLabel.numberOfLines = 0
        cookLabel.translatesAutoresizingMaskIntoConstraints = false
        return cookLabel
    }()
    
    private func welcomeLabelConfigConstraints() {
        NSLayoutConstraint.activate([
            self.welcomeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 110),
            self.welcomeLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.welcomeLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)])
    }
    
    private func searchbarConfigConstraints() {
        NSLayoutConstraint.activate([
            self.searchBar.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
            self.searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)])
    }
    
    private func veganFoodButtonConfigConstraints() {
        NSLayoutConstraint.activate([
            self.veganFoodButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 21),
            self.veganFoodButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 36),
            self.veganFoodButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -296),
            self.veganFoodButton.heightAnchor.constraint(equalToConstant: 59)])
    }
    
    private func glutenFreeButtonConfigConstraints() {
        NSLayoutConstraint.activate([
            self.glutenFreeButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 21),
            self.glutenFreeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 117),
            self.glutenFreeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -216),
            self.glutenFreeButton.heightAnchor.constraint(equalToConstant: 59)])
    }
    
    private func dairyFreeButtonConfigConstraints() {
        NSLayoutConstraint.activate([
            self.dairyFreeButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 21),
            self.dairyFreeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 199),
            self.dairyFreeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -131),
            self.dairyFreeButton.heightAnchor.constraint(equalToConstant: 59)])
    }

    private func ketogenicButtonConfigConstraints() {
        NSLayoutConstraint.activate([
            self.ketogenicButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 21),
            self.ketogenicButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 283),
            self.ketogenicButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -47),
            self.ketogenicButton.heightAnchor.constraint(equalToConstant: 59)])
    }
    
    private func gifImageConfigConstraints() {
        NSLayoutConstraint.activate([
            self.foodImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 250),
            self.foodImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.foodImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60)
        ])
    }
    
    private func searchLabelConfigConstraints() {
        NSLayoutConstraint.activate([
            self.cookLabel.topAnchor.constraint(equalTo: veganFoodButton.bottomAnchor, constant: 400),
            self.cookLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10)])
    }
}
