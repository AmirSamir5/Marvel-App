//
//  MarvelsTableViewCell.swift
//  Marvel-App
//
//  Created by Mac on 6/17/19.
//  Copyright © 2019 Amir. All rights reserved.
//

import UIKit

class MarvelsTableViewCell: UITableViewCell {
    
    
    //MARK:- Outlets
    @IBOutlet weak var viewMain: UIView!
    @IBOutlet weak var imgMarvel: ImageLoader!
    @IBOutlet weak var lblMarvel: UILabel!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    
    

    //MARK:- Variables
    var cellId = -1
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
}
