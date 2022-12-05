//
//  animeData.swift
//  Anixart
//
//  Created by Rustem on 05.12.2022.
//

import Foundation
import UIKit

//struct AnimeData: Decodable {
//    let anime: [Anime]
//    let title: String
//
//}
struct AnimeData: Decodable{
    let id: Int
    let title: String
    let description: String
    let episode: Int
//    let allEpisods: Int
    let rate: Double
    let image: String
}

