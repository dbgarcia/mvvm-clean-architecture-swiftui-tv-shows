//
//  GetAllEpisodesUseCase.swift
//  TVSeries
//
//  Created by Douglas Garcia on 16/10/22.
//

import Foundation

protocol GetAllEpisodesUseCaseProtocol {
    func execute(id: Int) async throws -> [Episodeable]
}
