//
//  NetworkMarvel.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//

import Foundation


class NetworkMarvel{
    
    //Get Products Request and return Array Of Model Data if success or Error Message If Fail
    public static func getAllMarvels(successed: @escaping (_ productData: RootModelData) -> (), failed: @escaping(_ errorMsg: String) ->()){
        var rootData: RootModelData?
        
        NetworkingServices.instance.get(url: URL_BASE, parameters: nil, body: nil) { (success, response, statusCode, errorMsg) in
            
            
            if success{
                rootData = decode(decodable: RootModelData.self, data: response as! Data)
                guard let rootData = rootData else{
                    failed(Messages.ErrorMessages.Wrong.rawValue)
                    return
                }
                successed(rootData)
            }else{
                switch statusCode{
                case 404:
                    failed(Messages.ErrorMessages.NoProducts.rawValue)
                default:
                    failed(Messages.ErrorMessages.Wrong.rawValue)
                }
            }
        }
    }
}
