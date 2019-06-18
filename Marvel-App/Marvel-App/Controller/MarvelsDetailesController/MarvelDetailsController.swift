//
//  MarvelDetailsController.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//

import UIKit
import CoreData



class MarvelDetailsController: UIViewController {

    
    
    //MARK:- Outlets
    @IBOutlet weak var imgMarvel: UIImageView!
    @IBOutlet weak var lblMarvelName: UILabel!
    @IBOutlet weak var heightImgMarvel: NSLayoutConstraint!
    
    
    
    //MARK:- Variables
    var selectedId: Int?
    
    
    
    
    
    //MARK:- Views
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
    }
    
    
    
    //MARK:- Setup Functions
    func uiSetup(){
        view.backgroundColor = Colors.getBackgroundColor()
        FilterCoreData()
    }
    func FilterCoreData(){
        let fetchRequest = NSFetchRequest<Marvel>(entityName: CoreDataManager.instance.moduleName)
        fetchRequest.predicate = NSPredicate(format: "itemId == %@", "\(Int16(selectedId!))")
        
        do{
            let item = try CoreDataManager.instance.managedObjectContext.fetch(fetchRequest).first
            guard let productItem = item else { return }
            guard let image = productItem.itemImage else { return }
            
            let height = Int(productItem.imageHeight)
            let width  = Int(productItem.imageWidth)
            
            lblMarvelName.text = productItem.itemTitle
            imgMarvel.image = UIImage(data: image)
            heightImgMarvel.constant = CGFloat(((Int(UIScreen.main.bounds.width) - 32) * height) / width)
            
        }catch{
            fatalError("error executing fetch request")
        }
    }
    
    
    
    
    //MARK:- Server Functions
    
    
    
    
    
    
    
    
    //MARK:- Actions
}









































