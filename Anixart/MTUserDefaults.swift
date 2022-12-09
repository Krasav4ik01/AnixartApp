//
//  MTUserDefaults.swift
//  Anixart
//
//  Created by Rustem on 09.12.2022.
//

import Foundation

struct MTUserDefaults{
    
    static var shared = MTUserDefaults()
    
    var theme: Theme {
        get {
            Theme(rawValue: UserDefaults.standard.integer(forKey: "selectedTheme")) ?? .dark
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: "selectedTheme")
        }
    }
}
