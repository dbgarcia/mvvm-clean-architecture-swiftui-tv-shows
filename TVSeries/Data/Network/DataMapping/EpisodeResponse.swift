//
//  EpisodeEntity.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

struct EpisodeResponse: Decodable, Episodeable {
    var id: Int
    var name: String
    var season: Int
    var number: Int
    var image: ImageEntity?
}
