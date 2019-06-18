//
//  Colors.swift
//  NoorADSL
//
//  Created by Mac on 3/24/19.
//  Copyright © 2019 Omar Hassan. All rights reserved.
//

import UIKit



class Colors {
    
    
    private static let primaryColor                     = #colorLiteral(red: 0.04745423794, green: 0.05077643692, blue: 0.05525118113, alpha: 1)
    private static let secondryColor                    = #colorLiteral(red: 0.9658924937, green: 0.1821174622, blue: 0.1369256675, alpha: 1)
    private static let backgroundColor                  = #colorLiteral(red: 0.1545972824, green: 0.1678023338, blue: 0.1856916249, alpha: 1)
	
    
    
    
    public static func getPrimaryColor() -> UIColor {
        return self.primaryColor
    }
    public static func getSecondryColor() -> UIColor {
        return self.secondryColor
    }
    public static func getBackgroundColor() -> UIColor{
        return self.backgroundColor
    }
}
