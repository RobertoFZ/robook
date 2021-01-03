//
//  AppConstants.swift
//  Subasta Ganadera
//
//  Created by Roberto Franco on 04/09/20.
//  Copyright © 2020 Roberto Franco. All rights reserved.
//

import Foundation
import UIKit

public struct Assets {
    
    public enum Icons: String {
        case Menu = "menu"
    }
}

public struct Preferences {
    public enum UserPreferences: String {
        case ID = "id"
        case Email = "email"
        case FirstName = "first_name"
        case LastName = "last_name"
        case Token = "token"
        case AppleEmail = "apple_email"
        case ApplePassword = "apple_password"
    }
    public enum ProfilePreferences: String {
        case Locale = "locale"
    }
}

// MARK: General

open class Fonts {
    public static func DDinCondensed(size: CGFloat) -> UIFont {
        return UIFont(name: "DIN Condensed", size: size)!
    }
}

// MARK: Colors

open class Colors {
    public static let BluePrimary = UIColor(hex: "2173A6")
    public static let BlueTransparent = UIColor(red: 33/255, green: 115/255, blue: 166/255, alpha: 0.5)
    public static let Brown = UIColor(hex: "8C6637")
    public static let BrownTransparent = UIColor(red: 140/255, green: 102/255, blue: 55/255, alpha: 0.5)
    public static let BrownSemiTransparent = UIColor(red: 140/255, green: 102/255, blue: 55/255, alpha: 0.9)
    public static let Green = UIColor(hex: "39AE50")
    public static let GreenTransparent = UIColor(red: 57/255, green: 174/255, blue: 80/255, alpha: 0.5)
    public static let Yellow = UIColor(hex: "F2BA51")
}
