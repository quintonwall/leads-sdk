//
//  Theme.swift
//  Pods
//
//  Created by Quinton Wall on 1/28/16.
//
//

import UIKit



public enum LeadsTheme : Int {
    case `default`, dark, graphical
    
    public var mainColor: UIColor {
        switch self {
        case .default:
            return UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)  //salesforce blue
        case .dark:
            return UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)  //salesforce blue
        case .graphical:
            return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        }
    }
    
    public var borderColor : UIColor {
        switch self {
        case .default:
            return  UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)  //salesforce blue
        case .dark:
            return UIColor(red: 11.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)  //super dark blue
        case .graphical:
            return UIColor(red: 11.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)  //super dark blue
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .default:
            return UIColor(white: 1.0, alpha: 1.0)
        case .dark, .graphical:
            return UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)
        }
    }
    
    var fontColor: UIColor {
        switch self {
        case .default:
            return UIColor(red: 74.0/255.0, green: 144.0/255.0, blue: 226.0/255.0, alpha: 1.0)  //salesforce blue
        case .dark:
            return UIColor(red: 11.0/255.0, green: 61.0/255.0, blue: 120.0/255.0, alpha: 1.0)  //super dark blue
        case .graphical:
            return UIColor(red: 255.0/255.0, green: 255.0/255.0, blue: 255.0/255.0, alpha: 1.0) //white
        }
    }
    
    var backgroundImage: UIImage? {
        switch self {
        case .graphical:
            let podBundle = Bundle(for: Leads.self)
            if let bundleURL = podBundle.url(forResource: "leads-sdk", withExtension: "bundle") {
                if let bundle = Bundle(url: bundleURL) {
                      return UIImage(named: "leadsBackground.png", in: bundle, compatibleWith: nil)
                }
            }
            return nil
           
        case .default, .dark:
            return nil
        }
    }
    
}

public let SelectedThemeKey = "SelectedTheme"

public struct LeadsThemeManager {
    
    public static func currentTheme() -> LeadsTheme {
        if let storedTheme = (UserDefaults.standard.value(forKey: SelectedThemeKey) as AnyObject).int32Value {
            return LeadsTheme(rawValue: Int(storedTheme))!
        } else {
            return .default
        }
    }
    
    public static func applyTheme(_ theme: LeadsTheme, leadsbutton: LeadsButton) {
        // 1
        UserDefaults.standard.setValue(theme.rawValue, forKey: SelectedThemeKey)
        UserDefaults.standard.synchronize()
        
        //leadsbutton.tintColor = theme.mainColor
        leadsbutton.layer.borderWidth = 1
        leadsbutton.layer.borderColor = theme.borderColor.cgColor
        leadsbutton.layer.backgroundColor = theme.backgroundColor.cgColor
        leadsbutton.setTitleColor(theme.fontColor, for: UIControlState())
        leadsbutton.setBackgroundImage(theme.backgroundImage, for: UIControlState())
        
        
    }
}

