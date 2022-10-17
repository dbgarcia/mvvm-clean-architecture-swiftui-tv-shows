//
//  DetailViewModel.swift
//  TVSeries
//
//  Created by Douglas Garcia on 10/09/22.
//

import Foundation

protocol DetailViewModelProtocol {
    var isVisibleLoading: Bool { get }
    var isVisibleEmpty: Bool { get }
    var isVisibleList: Bool { get }
    
    func fetchEpisodes() async
}

final class DetailViewModel: ObservableObject, DetailViewModelProtocol {
    private let getEpisodes: GetAllEpisodesUseCaseProtocol
    
    init(show: Showable, getEpisodes: GetAllEpisodesUseCaseProtocol = GetAllEpisodes()) {
        self.show = show
        self.getEpisodes = getEpisodes
    }
    
    var isVisibleLoading: Bool {
        return viewState == .loading
    }
    
    var isVisibleEmpty: Bool {
        return viewState == .empty
    }
    
    var isVisibleList: Bool {
        return viewState == .finish
    }
    
    private var viewState: ViewState = .loading
    
    private(set) var show: Showable
    @Published private(set) var episodes: [Episodeable] = []
    
    @MainActor
    func fetchEpisodes() async {
        do {
            viewState = .loading
            episodes = try await getEpisodes.execute(id: show.id)
            viewState = .finish
        } catch {
            viewState = episodes.isEmpty ? .empty : .finish
        }
    }
}
