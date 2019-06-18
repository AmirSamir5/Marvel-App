//
//  Ext-SearchBar.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//

import UIKit


extension MarvelsController: UISearchResultsUpdating{
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if loadedFromCoreData{
            if !text.isEmpty {
                filteredCoreData = marvelsCoreData.filter { item in
                    guard let name = item.itemTitle else { return false }
                    return (name.lowercased().contains(text.lowercased()))
                }
            }else{
                filteredCoreData = marvelsCoreData
            }
        }else{
            if !text.isEmpty {
                filteredArray = marvelsArray.filter { item in
                    return (item.name.lowercased().contains(text.lowercased()))
                }
            }else{
                filteredArray = marvelsArray
            }
        }
        tvMarverls.reloadData()
    }
}
