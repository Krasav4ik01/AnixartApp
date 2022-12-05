//
//  AnimeManager.swift
//  Anixart
//
//  Created by Rustem on 05.12.2022.
//

import Foundation


protocol AnimeManagerDelegate{
    func didUpdateAnime(_ animeManager: AnimeManager, with model: AnimeModel)
    
    func didFailWithError(with: Error)
}

struct AnimeManager {
    var delegate: AnimeManagerDelegate?

    func fetchRequest(){
        let link = "https://kitsu.io/api/edge/anime"
        guard let URL = URL(string: link) else {return}
        let task = URLSession.shared.dataTask(with: URL) {data, response, error in
            if let data, error == nil{
                    let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(AnimeData.self, from: data)
//                    let title = decodedData.data.titles.en
                    let id = decodedData.id
                    let canonicalTitle = decodedData.title
                    let posterImage = decodedData.image
                    let synopsis = decodedData.description
                    let episodeCount = decodedData.episode
//                    let allEpisodes = decodedData.anime[0].allEpisods
                    let averageRating = decodedData.rate

                    let animeModel = AnimeModel(id: id, title: canonicalTitle, desc: synopsis, episodes: episodeCount, rate: averageRating)
                    delegate?.didUpdateAnime(self, with: animeModel)
                }
                catch {
                    print(error)
                    return
                }
            }
            else{
                print("Error")
            }
        }
        task.resume()
    }
}

//let url = URL(string: "https://kitsu.io/api/edge/anime")!
//var request = URLRequest(url: url)
//
//let task = URLSession.shared.dataTask(with: request) { data, response, error in
//  if let response = response {
//    print(response)
//
//    if let data = data, let body = String(data: data, encoding: .utf8) {
//      print(body)
//    }
//  } else {
//    print(error ?? "Unknown error")
//  }
//}
//
//task.resume()

//struct AnimeManager {
//    var delegate: AnimeManagerDelegate?
//
//    func fetchRequest(){
//        let url = URL(string: "https://kitsu.io/api/edge/anime")!
//        var request = URLRequest(url: url)
//
//        let task = URLSession.shared.dataTask(with: request) { data, response, error in
//          if let response = response {
//            print(response)
//
//            if let data = data, let body = String(data: data, encoding: .utf8) {
//                print(body)
//            }
//          } else {
//            print(error ?? "Unknown error")
//          }
//        }
//
//        task.resume()
//    }
//}
