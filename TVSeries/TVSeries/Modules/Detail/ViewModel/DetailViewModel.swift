//
//  DetailViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class DetailViewModel: ObservableObject {
    private let episodesRepository: EpisodesRepository
    private(set) var show: Showable
    
    @Published private(set) var viewState: ViewState = .loading
    @Published private(set) var episodes: [Episodeable] = []
    
    init(show: Showable, episodesRepository: EpisodesRepository = DIContainer.episodesRepository()) {
        self.show = show
        self.episodesRepository = episodesRepository
    }
    
    @MainActor
    func fetchEpisodes() async {
        do {
            viewState = .loading
            episodes = try await episodesRepository.fetchEpisodes(of: show.id)
            viewState = .finish
        } catch {
            viewState = episodes.isEmpty ? .empty : .finish
        }
    }
}
