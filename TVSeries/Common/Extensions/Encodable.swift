//
//  Encodable.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

extension Encodable {
    func toData() throws -> Data {
        let encoder = JSONEncoder()
        return try encoder.encode(self)
    }
}
