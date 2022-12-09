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
        URLSession.shared.dataTask(with: URL) {data, response, error in
            if let error = error{
                //                    let decoder = JSONDecoder()
                print(error)
                return
            }
            guard let data = data else { return }
            
            let jsonString = String(data: data, encoding: .utf8)
//            print(jsonString ?? "something")
            let decoder = JSONDecoder()
            
            do{
                let decodedData = try decoder.decode([AnimeData].self, from: data)
                print(decodedData.first?.animeData.first?.canonicalTitle)
            }
            catch{
                print(error)
            }
            
            
//                    let decodedData = try decoder.decode(AnimeData.self, from: data)
                    
                    
//                    let animeModel = AnimeModel(id: id, title: canonicalTitle, desc: synopsis, episodes: episodeCount, rate: averageRating)
//                    delegate?.didUpdateAnime(self, with: animeModel)
        }.resume()
//                catch {
//                    print(error)
//                    return
//                }
//            }
//            else{
//                print("Error")
//            }
//        }
//        task.resume()
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
