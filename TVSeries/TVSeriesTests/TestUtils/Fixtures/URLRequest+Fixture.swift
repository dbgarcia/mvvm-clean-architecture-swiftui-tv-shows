//
//  URLRequest+Fixture.swift
//  TVSeriesTests
//
//  Created by Douglas Garcia on 04/10/22.
//

import Foundation

extension URLRequest {
    
    static func fixture() -> URLRequest? {
        return URLRequest(url: .init(string: "https://api.tvmaze.com/shows")!)
    }
}
