//
//  FavoriteRecipe+CoreDataProperties.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 14/10/22.
//
//

import Foundation
import CoreData

extension FavoriteRecipe {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteRecipe> {
        return NSFetchRequest<FavoriteRecipe>(entityName: "FavoriteRecipe")
    }

    @NSManaged public var recipeId: Int64

}

extension FavoriteRecipe: Identifiable {

}
