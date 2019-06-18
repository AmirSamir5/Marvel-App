//
//  UIImageViewExt.swift
//  NoorADSL
//
//  Created by Omar Hassan  on 3/17/19.
//  Copyright © 2019 Omar Hassan. All rights reserved.
//

import UIKit


extension UIImageView {
    
    
    
    //MARK:- Default Image
    static var  defaultImage : UIImage  {
        return UIImage()
    }
    
    
    //MARK:- Rounded Image
    func circleImage() {
        self.layer.cornerRadius = self.frame.width / 2.0
        self.layer.masksToBounds = true
    }
    
    //MARK:- Blur Effect
    func makeBlurImage()
    {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }
    func removeBlurEffect() {
        let blurredEffectViews = self.subviews.filter{$0 is UIVisualEffectView}
        blurredEffectViews.forEach{ $0.removeFromSuperview() }
    }
}
