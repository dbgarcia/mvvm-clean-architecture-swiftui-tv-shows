//
//  ImageEntity.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

struct ImageEntity: Decodable {
    var medium: String
    var original: String
}

extension ImageEntity {
    func toImageURL() -> URL {
        return URL(string: medium ) ?? URL(fileURLWithPath: "")
    }
}
