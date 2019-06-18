//
//  SaveDataWrapper.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation
import CoreData


//This Class Used For: If you want change CoreData you make changes here not in whole code
class SaveDataWrapper{
    
    public static let shared = SaveDataWrapper()
    
    func saveData(){
        CoreDataManager.instance.saveContext()
    }
    func fetchMarvelRequest() throws -> [Marvel]{
        
        let fetchRequest = NSFetchRequest<Marvel>(entityName: CoreDataManager.instance.moduleName)
        do{
            let marvels = try CoreDataManager.instance.managedObjectContext.fetch(fetchRequest)
            
            return marvels
        }catch{
            fatalError("Couldn't Fetch Data")
        }
    }
    func saveMarvelsInCoreData(marvels: [ModelMarvel]){
        
        
        marvels.forEach({
            let marvel = Marvel(context: CoreDataManager.instance.managedObjectContext)
            
            marvel.itemTitle = $0.name
            marvel.itemId    = Int16($0.id)
            marvel.itemPrice = $0.price
            marvel.imageHeight = Int16($0.image.height) ?? 0
            marvel.imageWidth  = Int16($0.image.width) ?? 0
            saveData()
        })
    }
    func loadMarvelsFromCoreData() -> [ModelMarvel]{
        let marvels = [ModelMarvel]()
        
        
        
        
        return marvels
    }
}
