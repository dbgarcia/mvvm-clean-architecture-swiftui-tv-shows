//
//  Data+Fixture.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import Foundation

extension Data {
    static func fixture() -> Data? {
        """
        { \"name\": \"Teste\" }
        """.data(using: .utf8)
    }
}
