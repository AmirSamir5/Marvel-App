//
//  MarvelsController.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//

import UIKit

class MarvelsController: UIViewController {
    
    
    
    
    //MARK:- Outlets
    @IBOutlet weak var tvMarverls: UITableView!
    
    
    
    
    
    
    //MARK:- Variables
    let spinner = Spinner()
    var marvelsCoreData  =  [Marvel]()
    var filteredCoreData = [Marvel]()
    var marvelsArray  = [ModelMarvel]()
    var filteredArray = [ModelMarvel]()
    var searchController : UISearchController!
    var loadedFromCoreData = false
    var selectedId: Int?
    
    
    
    
    
    
    //MARK:- Views
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
    }
    
    
    
    //MARK:- Setup Functions
    func uiSetup(){
        setTableView()
        setNavImage()
        setRightNavBar()
        checkCoreData()
    }
    
    func setTableView(){
        tvMarverls.dataSource = self
        tvMarverls.delegate   = self
        tvMarverls.register(UINib(nibName: Cell_Marvels, bundle: nil), forCellReuseIdentifier: Cell_Marvels)
        tvMarverls.backgroundColor = Colors.getBackgroundColor()
        navigationController?.navigationBar.tintColor = Colors.getSecondryColor()
    }
    
    //Set Title Nav Image
    func setNavImage(){
        let logo = UIImage(named: "icn-nav-marvel")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }
    func setRightNavBar(){
        let image = UIImage(named: "icn-nav-search")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(setSearch))
    }
    //Set Search Bar For Items
    @objc func setSearch(){
        guard searchController == nil else { return }
        let search = setSearchBar(navItem: self.navigationItem, navController: self.navigationController!, viewController: self, placeholder:  Messages.Titles.Search.rawValue, tableView: tvMarverls)
        search.searchResultsUpdater = self
        searchController = search
    }
    
    
    
    
    
    
    
    //Check IF There is A Data In CoreData Or Not
    func checkCoreData(){
        do{
            let marvels = try SaveDataWrapper.shared.fetchMarvelRequest()
            
            if marvels.isEmpty{
                loadedFromCoreData = false
                loadMarvels()
            }else {
                loadedFromCoreData = true
                
                marvelsCoreData = marvels
                filteredCoreData = marvels
                
                tvMarverls.reloadData()
            }
        }catch{
            
        }
    }
    
    
    
    
    //MARK:- Server Functions
    func loadMarvels(){
        spinner.startLoading(viewOfScroll: self.view, message: Messages.LoadingMessages.Products.rawValue)
        
        NetworkMarvel.getAllMarvels(successed: { [weak self] (rootData) in
            
            guard let self = self else { return }
            self.marvelsArray  = rootData.marvel
            self.filteredArray = rootData.marvel
            self.saveToCoreData()
            
        }) { [weak self] (errorMsg) in
            
            guard let self = self else { return }
            self.getMarvelsFailed()
            
            
        }
    }
    func saveToCoreData(){
        SaveDataWrapper.shared.saveMarvelsInCoreData(marvels: marvelsArray)
        tvMarverls.reloadData()
        spinner.stopLoading(viewOfScroll: self.view)
    }
    func getMarvelsFailed(){
        spinner.stopLoading(viewOfScroll: self.view)
    }
    
    
    //MARK:- Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MarvelDetailsController {
            destination.selectedId = selectedId
        }
    }
    
    
    
    //MARK:- Actions
    
}




























