//
//  GenreArtistDetails.swift
//  Collection_
//
//  Created by Arnaud Hayon on 25/12/2024.
//

import SwiftUI

struct GenreArtistDetails: View {
    
    var vinyl = [Vinyls].mock1
    
    let genreId: Int
    
    let columns = [
        GridItem(.flexible(), alignment: .leading)
    ]
    
    var filteredVinyls: [Vinyls] {
        vinyl.filter { vinyl in
            vinyl.artist_id == genreId
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(filteredVinyls) { vinyl in
                    HStack(alignment: .center, spacing: 10) {
                        AsyncImage(url: URL(string: vinyl.cover_image_url)) { image in
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(vinyl.title)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .lineLimit(1)
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.tileBackground)
                    .cornerRadius(10)
                }
            }
            .padding()
        }
        .navigationTitle("Genre")
        
    }
}

#Preview {
    GenreArtistDetails(genreId: 1)
}
