//
//  DetailView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        
        ScrollView {
            
            DetailHeaderView(show: viewModel.show)
            DetailMiddleView(show: viewModel.show)
            
            ZStack {
                DetailEpisodesView(episodes: viewModel.episodes)
                    .visiblity(viewModel.isVisibleList)
                
                EmptyView(systemName: "exclamationmark.triangle.fill", message: "Empty Episodes...")
                    .visiblity(viewModel.isVisibleEmpty)
                    .hidden()
                
                LoadingView()
                    .visiblity(viewModel.isVisibleLoading)
            }
            
            .task {
                await viewModel.fetchEpisodes()
            }
        }
        
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let show = ShowResponse(id: 1, name: "Example", genres: ["Action"])
        let viewModel = DetailViewModel(show: show)
        DetailView(viewModel: viewModel)
    }
}
