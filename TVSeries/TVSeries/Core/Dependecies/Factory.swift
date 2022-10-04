//
//  Dependecies.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Factory

class DIContainer {
    static let network = Factory(scope: .singleton) { Network() }
}
