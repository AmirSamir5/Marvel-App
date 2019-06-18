//
//  Ext-TableView.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//

import UIKit



extension MarvelsController: UITableViewDataSource, UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if loadedFromCoreData{
            return filteredCoreData.count
        }else{
            return filteredArray.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Cell_Marvels, for: indexPath) as? MarvelsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle  = .none
        cell.backgroundColor = UIColor.clear
        cell.selectionStyle  = .none
        
        if loadedFromCoreData {
            let marvel = filteredCoreData[indexPath.row]
            let imageHeight = Int(marvel.imageHeight)
            let imageWidth  = Int(marvel.imageWidth)
            
            cell.cellId                   = Int(marvel.itemId)
            cell.lblMarvel.text           = marvel.itemTitle
            cell.imageHeight.constant     = CGFloat(((Int(UIScreen.main.bounds.width) - 32) * imageHeight) / imageWidth)
            guard let imageData = marvel.itemImage else { return cell}
            cell.imgMarvel.image = UIImage(data: imageData)
            
        }else{
            let marvel = filteredArray[indexPath.row]
            let imageHeight = Int(marvel.image.height)
            let imageWidth  = Int(marvel.image.width)
            
            cell.cellId                   = marvel.id
            cell.lblMarvel.text           = marvel.name
            cell.imageHeight.constant     = CGFloat(((Int(UIScreen.main.bounds.width) - 32) * imageHeight!) / imageWidth!)
            cell.imgMarvel.loadAndSaveImage(urlString: marvel.image.link, product_id: marvel.id)
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MarvelsTableViewCell else { return }
        selectedId = cell.cellId
        performSegue(withIdentifier: GoTo_MarvelDetails, sender: self)
    }
}
