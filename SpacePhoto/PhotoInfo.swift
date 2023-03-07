//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by Arda Toprak on 7.03.2023.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: URL
    var copyright: String?
    
    // Eğer tanımlamış olduğunuz değişkenlerin isimleri, JSON'daki key'lerden farklı ise
    // o zaman CodingKeys enum'ını tanımlayarak her bir değişkeninizin JSON karşılıpındaki adını belirtmeniz gerekir.
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case description = "explanation"
        case url = "url"
        case copyright = "copyright"
    }
}
