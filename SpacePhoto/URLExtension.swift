//
//  URLExtension.swift
//  SpacePhoto
//
//  Created by Arda Toprak on 7.03.2023.
//

import Foundation

extension URL {
    
    // Dictionary olarak alınan parametrelerin, URL'in sonuna eklenmesini sağlayacak bir fonksiyon.
    func withQueries(_ queries: [String : String]) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.map { URLQueryItem(name: $0.0, value: $0.1) }
        
        return components?.url
    }
}

