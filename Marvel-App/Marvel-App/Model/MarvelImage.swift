//
//  MarvelImage.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//

struct ModelMarvelImage: Decodable{
    
    var link: String
    var height: String
    var width: String
    
    private enum CodingKeys: String, CodingKey{
        case link, height, width
    }
}

