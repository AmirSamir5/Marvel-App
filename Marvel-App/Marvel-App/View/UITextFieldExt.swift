//
//  CustomPlaceHolderColor.swift
//  BashairProject
//
//  Created by Mac on 9/25/18.
//  Copyright © 2018 Amir. All rights reserved.
//

import UIKit


extension UITextField{
    @IBInspectable var placeHolderColor: UIColor? {
        get {
            return self.placeHolderColor
        }
        set {
            self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
        }
    }
}
