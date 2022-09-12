//
//  ShowView.swift
//  TVSeries
//
//  Created by Douglas Garcia on 11/09/22.
//

import SwiftUI

struct TVShowRowView: View {
    var show: Showable
    
    var body: some View {
        HStack(alignment: .top, spacing: 0) {
            AsyncImage(url: show.image?.toImageURL()) { image in
                image.resizable().scaledToFit()
            } placeholder: {
                Color.gray
                    .padding()
            }
            .frame(width: 100, height: 100)
            .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                Text(show.name)
                    .tint(Color.primary)
                    .padding(.trailing)
                    .multilineTextAlignment(.leading)
                    .font(.headline)
                
                Text(show.toGenresFormated())
                    .fontWeight(.thin)
                    .font(.footnote)
                    .tint(Color.primary)
            }
        }
    }
}
