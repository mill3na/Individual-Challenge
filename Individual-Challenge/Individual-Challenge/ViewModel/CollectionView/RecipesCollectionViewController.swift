//
//  HomeScreenCollectionViewController.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 17/10/22.
//

import UIKit

class RecipesCollectionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    private var collectionView: UICollectionView?
    var numberOfCells: Int = 0
    var recipes = RecipeResult(offset: 0, number: 0, totalResults: 0, results: [])
    var query = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (view.frame.size.width - 10), height: (view.frame.size.height/2))
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        guard let collectionView = collectionView else {
            return
        }
        collectionView.register(RecipesCollectionViewCell.self, forCellWithReuseIdentifier: RecipesCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.frame(forAlignmentRect: CGRect(x: 0, y: 0, width: view.layer.frame.width, height: view.layer.frame.height))
        
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCells
        }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecipesCollectionViewCell.identifier, for: indexPath) as? RecipesCollectionViewCell else {
                            return UICollectionViewCell(frame: .zero)
                        }
        cell.recipeInfo = recipes.results[indexPath.row]
        
        return cell
    }
}
