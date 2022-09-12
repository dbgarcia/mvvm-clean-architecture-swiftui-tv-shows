//
//  DetailViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

final class DetailViewModel: ObservableObject, BaseDetailViewModel {
    var isVisibleLoading: Bool {
        return viewState == .loading
    }
    
    var isVisibleEmpty: Bool {
        return viewState == .empty
    }
    
    var isVisibleList: Bool {
        return viewState == .finish
    }
    
    
    
    private let episodesRepository: EpisodesRepository
    private var viewState: ViewState = .loading
    
    private(set) var show: Showable
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
