//
//  UIViewExt.swift
//  NoorADSL
//
//  Created by Mac on 3/27/19.
//  Copyright © 2019 Omar Hassan. All rights reserved.
//

import UIKit




extension UIView{
    
    
    func circleView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.masksToBounds = true
    }
    func addWhiteBorder(){
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 8
    }
    func cornerRadius(radius: CGFloat){
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
    
    func cornerShadowView(color: UIColor) {
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 4.0
    }
}
