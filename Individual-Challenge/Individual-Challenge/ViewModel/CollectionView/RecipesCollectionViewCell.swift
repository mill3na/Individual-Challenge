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
    
    let foodImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.contentMode = .scaleAspectFit
//        image.frame = CGRect(x: 60, y: 253, width: 255, height: 230)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemMint
        self.addSubview(foodImage)
        self.addSubview(label)
        self.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        foodImage.frame = CGRect(x: contentView.frame.size.width/2 - 50, y: contentView.frame.size.height/2 - 50, width: 100, height: 100)
        
        label.frame = CGRect(x: 0, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height/3)
    }
}
