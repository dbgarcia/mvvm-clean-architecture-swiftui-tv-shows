//
//  SerieEntity.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

struct ShowResponse: Showable, Decodable {
    var id: Int
    var name: String
    var genres: [String]
    var status: String
    var summary: String
    var image: ImageEntity?
}
