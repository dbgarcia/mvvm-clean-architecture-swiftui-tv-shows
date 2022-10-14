//
//  EpisodeView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct DetailEpisodeRowView: View {
    var episode: Episodeable
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            AsyncImage(url: episode.image?.toImageURL()) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Color.gray
                    .frame(width: 120, alignment: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .frame(width: 120, alignment: .top)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            Rectangle()
                .fill(Color.black.opacity(0))
                .frame(width: 10)
            
            VStack(alignment: .leading) {
                Text(episode.toSeasonEpisodeTitle())
                    .tint(Color.primary)
                    .padding(.trailing)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                
                Text(episode.name)
                    .fontWeight(.thin)
                    .font(.footnote)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
            }
        }
    }
}
