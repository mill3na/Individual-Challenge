//
//  SearchScreenView.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 14/10/22.
//

import UIKit

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

        self.addSubview(searchLabel)
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
//        searchBar.tintColor = .blue
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    let veganFoodButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .gray
        button.setTitle("Vegan", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.layer.cornerRadius = 9
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let glutenFreeButton: UIButton = {
        let glutenFree = UIButton()
        glutenFree.backgroundColor = .gray
        glutenFree.setTitle("No gluten", for: .normal)
        glutenFree.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        glutenFree.layer.cornerRadius = 9
        glutenFree.titleLabel?.numberOfLines = 0
        glutenFree.titleLabel?.textAlignment = NSTextAlignment.center
        glutenFree.translatesAutoresizingMaskIntoConstraints = false
        return glutenFree
    }()

    let dairyFreeButton: UIButton = {
        let dairyFree = UIButton()
        dairyFree.backgroundColor = .gray
        dairyFree.setTitle("Dairy free diet", for: .normal)
        dairyFree.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        dairyFree.layer.cornerRadius = 9
        dairyFree.titleLabel?.numberOfLines = 0
        dairyFree.titleLabel?.textAlignment = NSTextAlignment.center
        dairyFree.translatesAutoresizingMaskIntoConstraints = false
        return dairyFree
    }()

    let ketogenicButton: UIButton = {
        let ketogenic = UIButton()
        ketogenic.backgroundColor = .gray
        ketogenic.setTitle("Keto- genic", for: .normal)
        ketogenic.titleLabel?.font = UIFont.systemFont(ofSize: 14)
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
    
    let searchLabel: UILabel = {
        var searchLabel = UILabel()
        searchLabel.text = "No recipe to show yet."
        searchLabel.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        searchLabel.textColor = .black
        searchLabel.numberOfLines = 0
        searchLabel.translatesAutoresizingMaskIntoConstraints = false
        return searchLabel
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
            self.searchLabel.topAnchor.constraint(equalTo: veganFoodButton.bottomAnchor, constant: 400),
            self.searchLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 10)])
    }
}
