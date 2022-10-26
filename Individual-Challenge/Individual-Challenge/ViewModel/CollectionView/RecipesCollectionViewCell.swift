//
//  HomeScreenCollectionViewCell.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 17/10/22.
//

import UIKit

class RecipesCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeScreenCollectionViewCell"
//    private var imageURl = ""
    var recipeInfo: Recipe! {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.label.text = self?.recipeInfo.title
                
            }
            
//            API().getRecipeInstructions(id: recipeInfo.id, handler: { instructions in
////                let inst: RecipeInstructionResult = [instructions.steps]
//                if let instructions {
//                    if let inst = instructions.first?.steps {
//                        print("steps of the recipe \(self.recipeInfo.title): \(inst.count). Steps: \(inst.first)")
//                    }
//                }
//
//            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(label)
        self.recipeTitleConfigConstraints()
        
        self.addSubview(favoriteRecipe)
        self.favoriteRecipeConfigConstraints()
        
        self.addSubview(seeRecipeButton)
        self.seeRecipeConfigConstraints()
        
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
    
    private let seeRecipeButton: UIButton = {
        let seeRecipeButton = UIButton()
        seeRecipeButton.setImage(UIImage(systemName: "arrow.right.circle"), for: .normal)
        seeRecipeButton.translatesAutoresizingMaskIntoConstraints = false
        return seeRecipeButton
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
    
    private func seeRecipeConfigConstraints() {
        NSLayoutConstraint.activate([
            self.seeRecipeButton.topAnchor.constraint(equalTo: favoriteRecipe.bottomAnchor, constant: 20),
            self.seeRecipeButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
}
