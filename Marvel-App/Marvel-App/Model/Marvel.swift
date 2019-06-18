//
//  Marvel.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//




struct RootModelData: Decodable {
    
    var marvel: [ModelMarvel]
    
    private enum CodingKeys: String,CodingKey{
        case marvel = "data"
    }
}

struct ModelMarvel: Decodable {
    
    var id: Int
    var name: String
    var productDescription: String
    var price : Double
    var image: ModelMarvelImage
    
    private enum CodingKeys: String, CodingKey{
        case id, name, productDescription, price, image
    }
}
