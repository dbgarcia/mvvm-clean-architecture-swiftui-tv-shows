//
//  URLComponents+Fixture.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import Foundation

extension URLComponents {
    
    static func fixture() -> URLComponents? {
        return URLComponents(string: "https://api.tvmaze.com/shows?page=0")
    }
}
