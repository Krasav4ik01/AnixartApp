//
//  AnimeLists.swift
//  Anixart
//
//  Created by Rustem on 19.11.2022.
//

import Foundation

struct AnimeLists {
    let title: String
    let desc: String
    
    static func GetAnime() -> [AnimeLists] {
        return [
            AnimeLists(title: "Naruto", desc: "Bla Bla"),
            AnimeLists(title: "Bleach", desc: "bleeeeaaach"),
            AnimeLists(title: "One Punchman", desc: "one punch"),
        ]
    }
}
