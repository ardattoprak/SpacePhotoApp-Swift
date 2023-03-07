//
//  NetworkController.swift
//  SpacePhoto
//
//  Created by Arda Toprak on 7.03.2023.
//

import Foundation

class NetworkController {
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?) -> Void) {
        let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query: [String : String] = [
            "api_key": "DEMO_KEY",
            "date": "2011-07-13"
        ]
        
        let queryUrl = baseUrl.withQueries(query)!
        
        let dataTask = URLSession.shared.dataTask(with: queryUrl) { (data, _, error) in
            let jsonDecoder = JSONDecoder()
            
            if let data = data, let photoInfoObject = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfoObject)
            }else {
                completion(nil)
            }
        }
        
        dataTask.resume()
    }
}
