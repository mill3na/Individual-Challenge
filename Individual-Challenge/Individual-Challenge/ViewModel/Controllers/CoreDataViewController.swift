//
//  CoreDataViewController.swift
//  Individual-Challenge
//
//  Created by Milena Maia Araújo on 14/10/22.
//

import UIKit
import CoreData

class CoreDataViewController: UIViewController {
    var favoriteRecipesList: [FavoriteRecipe]?
    
    func saveOnCoreData(recipeId: Int64, context: NSManagedObjectContext) {
        let favoriteRecipe = FavoriteRecipe(context: context)
        favoriteRecipe.recipeId = recipeId
        
        do {
            try context.save()
        } catch {
            print("ERROR: Couldn't save favorite recipe at the core data.")
            print(error)
        }
    }
    
    func fetchPeople(context: NSManagedObjectContext) {
        do {
            self.favoriteRecipesList = try context.fetch(FavoriteRecipe.fetchRequest())

        } catch {
            print("Could not fetch favorite requests.")
        }
    }
    
    func deleteFromCoreData (id: Int, context: NSManagedObjectContext) {
        let recipeToDelete = FavoriteRecipe.fetchRequest()
        recipeToDelete.predicate = NSPredicate(format: "recipeId==%@", "\(id)")
        do {
            let recipe = try context.fetch(recipeToDelete).first
            context.delete(recipe!)
            print("Recipe deleted.")
        } catch {
            print("there is no recipe with this id")
        }
        
        do {
            try context.save()
            fetchPeople(context: context)
        } catch {
            print("wasn't able to delete from core data.")
        }
        
    }
}
