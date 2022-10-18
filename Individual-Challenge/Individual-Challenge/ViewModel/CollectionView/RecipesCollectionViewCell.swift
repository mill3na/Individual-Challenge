//
//  HomeScreenCollectionViewCell.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 17/10/22.
//

import UIKit

class RecipesCollectionViewCell: UICollectionViewCell {
    
    var recipeInfo: Recipe! {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.label.text = self?.recipeInfo.title
            }
        }
    }
    
    static let identifier = "HomeScreenCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(named: "SecondGreen")
        self.addSubview(foodImage)
        self.addSubview(label)
        self.addSubview(instructions)
//        self.addSubview(favoriteRecipe)
        self.layoutSubviews()
    }
    
    let foodImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
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
        }
        else {
            favoriteRecipe.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    let instructions: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        foodImage.frame = CGRect(x: contentView.frame.size.width/2 - 50, y: contentView.frame.size.height/2 - 50, width: 100, height: 100)
        
        label.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width - 30, height: (contentView.frame.size.height/3) - 30)
        
        favoriteRecipe.frame = CGRect(x: contentView.frame.size.width - 100, y: 20, width: 30, height: 30)
        
        instructions.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
    }
}
