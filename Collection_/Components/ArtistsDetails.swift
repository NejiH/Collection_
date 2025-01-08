//
//  ArtistsDetails.swift
//  Collection_
//
//  Created by Arnaud Hayon on 24/12/2024.
//

import SwiftUI

struct ArtistsDetails: View {
    var vinyls = [Vinyl].mock
    var artist = [Artist].mock
    
    let artistId: Int
    
    let columns = [
        GridItem(.flexible(), alignment: .leading)
    ]
    
    var filteredVinyls: [Vinyl] {
        vinyls.filter { vinyl in
            vinyl.artist_id == artistId
        }
    }
    
    var artistName: String {
            if let currentArtist = artist.first(where: { $0.id == artistId }) {
                return currentArtist.name
            }
            return "Artist"
        }
    
    var body: some View {
        ScrollView {
//            LazyVGrid(columns: columns, spacing: 10) {
//                ForEach(filteredVinyls) { vinyl in
//                    NavigationLink(destination: VinylDetails(vinyl: vinyl)) {
//                        HStack(alignment: .center, spacing: 10) {
//                            AsyncImage(url: URL(string: vinyl.cover_image_url)) { image in
//                                image
//                                    .resizable()
//                            } placeholder: {
//                                ProgressView()
//                            }
//                            .frame(width: 100, height: 100)
//                            .cornerRadius(10)
//                            
//                            Text(vinyl.title)
//                                .font(.title2)
//                                .fontWeight(.heavy)
//                                .foregroundStyle(.white)
//                                .lineLimit(1)
//                            
//                            Spacer()
//                        }
//                        .padding()
//                        .background(Color.tileBackground)
//                        .cornerRadius(10)
//                    }
//                }
//            }
//            .padding()
        }
        .navigationTitle(artistName)
    }
}

#Preview {
    ArtistsDetails(artistId: 5)
}
