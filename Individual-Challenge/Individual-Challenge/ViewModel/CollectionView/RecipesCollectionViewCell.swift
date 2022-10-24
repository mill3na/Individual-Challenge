//
//  HomeScreenCollectionViewCell.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 17/10/22.
//

import UIKit

class RecipesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeScreenCollectionViewCell"

    var recipeInfo: Recipe! {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.label.text = self?.recipeInfo.title
            }
            
            API().getRecipeInstructions(id: recipeInfo.id, handler: { instructions in
                DispatchQueue.main.async { [weak self] in
//                    self?.instructions.text = instructions?.description
                    print(instructions?.description as Any)
                }
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "SecondGreen")
        self.addSubview(label)
        self.recipeTitleConfigConstraints()
        
        self.addSubview(favoriteRecipe)
        self.favoriteRecipeConfigConstraints()
        
        self.addSubview(instructions)
        self.recipeInstructionsConfigConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let favoriteRecipe: UIButton = {
       let favorite = UIButton()
        favorite.setImage(UIImage(systemName: "heart"), for: .normal)
        favorite.tintColor = .red
        favorite.translatesAutoresizingMaskIntoConstraints = false
        favorite.addTarget(self, action: #selector(favoriteRecipeAction), for: .touchUpInside)
        return favorite
    }()
    
    @objc func favoriteRecipeAction() {
        if favoriteRecipe.currentImage == UIImage(systemName: "heart") {
            favoriteRecipe.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            favoriteRecipe.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    var instructions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private func recipeTitleConfigConstraints() {
        NSLayoutConstraint.activate([
            self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            self.label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40)
        ])
    }
    
    private func favoriteRecipeConfigConstraints() {
        NSLayoutConstraint.activate([
            self.favoriteRecipe.topAnchor.constraint(equalTo: self.topAnchor, constant: 30),
            self.favoriteRecipe.leadingAnchor.constraint(equalTo: self.label.trailingAnchor, constant: 10),
            self.favoriteRecipe.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    private func recipeInstructionsConfigConstraints() {
        NSLayoutConstraint.activate([
            self.instructions.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 30),
            self.instructions.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.instructions.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)])
    }
    
}
