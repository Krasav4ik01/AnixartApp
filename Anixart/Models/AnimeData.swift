//
//  animeData.swift
//  Anixart
//
//  Created by Rustem on 05.12.2022.
//

import Foundation
import UIKit


struct AnimeData: Decodable{
    let animeData: [Anime]
}

struct Anime: Decodable{
    let id: Int
    let canonicalTitle: String
    let posterImage: AnimeImages
    let synopsis: String
    let episodeCount: Int
    let averageRating: String
    let favoritesCount: Int
    
}
struct AnimeImages: Decodable {
    let tiny: String
}
