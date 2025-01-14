//
//  GenresDetails.swift
//  Collection_
//
//  Created by Arnaud Hayon on 20/12/2024.
//

import SwiftUI

struct GenresDetails: View {
    
    let vinyls = [Vinyl].mock
    let genre = [Genre].mock
    
    let genreId: UUID
    
    let columns = [
        GridItem(.flexible(), alignment: .leading)
    ]
    
    var filteredVinyls: [Vinyl] {
        vinyls.filter { vinyl in
            vinyl.genre_id == genreId
        }
    }
    
    var genreName: String {
            if let currentGenre = genre.first(where: { $0.id == genreId }) {
                return currentGenre.genre_name
            }
            return "Genre"
        }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
//                ForEach(filteredVinyls) { vinyl in
//                    NavigationLink(destination: VinylDetails(vinyl: $vinyl)) {
//                        HStack(alignment: .center, spacing: 10) {
//                            AsyncImage(url: URL(string: vinyl.cover_image_url)) { image in
//                                image
//                                    .resizable()
//                                    .frame(width: 100, height: 100)
//                                    .cornerRadius(10)
//                            } placeholder: {
//                                ProgressView()
//                            }
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
            }
            .padding()
        }
        .navigationTitle(genreName)
        
    }
}
#Preview {
    GenresDetails(genreId: UUID(uuidString: "1A4F3C2B-8D7E-4F6A-9B2C-5E3D8A7C1F4E")!)
}
