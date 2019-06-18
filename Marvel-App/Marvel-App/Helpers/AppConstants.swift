//
//  AppConstants.swift
//  ProductsProject
//
//  Created by Mac on 2/14/19.
//  Copyright © 2019 Amir. All rights reserved.
//






//MARK:- Typealias
typealias CompletionHandler = (_ Success: Bool,_ JSONObject: Any?,_ StatusCode: Int,_ errorMsg: String?) -> ()





//MARK:- Static Variables
let String_Base_Header = [ "Content-Type":"application/json" ]
let API_KEY = "56f46a83358d8b919d553452a3b06941"





//MARK:- URL Strings
let URL_BASE = "https://limitless-forest-98976.herokuapp.com"
let URL_Marvel = URL_BASE + "characters"





//MARK:- Cells Names
let Cell_Marvels = "MarvelsTableViewCell"




//MARK:- Segues Names
let GoTo_MarvelDetails = "GoToMarvelDetails"



//MARK:- Messages
struct Messages{
    
    enum Titles: String{
        case OK             = "OK"
        case Done           = "Done"
        case DoneAction     = "Success"
        case Search         = "Search"
        case cancel         = "Cancel"
    }
    
    enum LoadingMessages: String {
        case Products       = "Loading All Marvels..."
        case ProductDetails = "Loading Marvel Details..."
    }
    
    enum ErrorMessages: String{
        case Wrong          = "Something Went Wrong"
        case NoInternet     = "Please Check Your Internet Connection"
        case NoProducts     = "Products Not Found"
    }
}




