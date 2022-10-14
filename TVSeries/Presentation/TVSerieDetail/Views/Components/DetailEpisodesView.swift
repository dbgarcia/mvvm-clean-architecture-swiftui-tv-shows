//
//  DetailEpisodesView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct DetailEpisodesView: View {
    var episodes: [Episodeable]
    
    var body: some View {
        LazyVStack(alignment: .leading) {
            ForEach(episodes, id: \.name) { episode in
                DetailEpisodeRowView(episode: episode)
                    .padding(.horizontal)
            }
        }
    }
}
