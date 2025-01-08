//
//  VynilDetail.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI

struct VinylDetails: View {
    
    @Binding var vinyl: Vinyl
    @State var artist = [Artist].mock
    @State var genre = [Genre].mock
    @Binding var collection: ItemCollection
    
    let columns = [
        GridItem(.fixed(300))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: vinyl.cover_image_url)) { image in
                    image
                        .resizable()
                    
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                .background(Color.tileBackground)
                .cornerRadius(10)

              Divider()
                Text(vinyl.title)
                    .font(.title)
                    //.font(.system(size: 40, weight: .bold))
                    .padding(1)
                
                
                NavigationLink(destination: ArtistsDetails(artistId: vinyl.artist_id)) {
                    if let artist = artist.first(where: { $0.id == vinyl.artist_id }) {
                        Text(artist.name)
                            .font(.headline)
                            .padding(1)
                    }
                    
                }
                
                HStack {
                    Text("Sortie :")
                        .font(.headline)
                     Text(vinyl.release_date.formattedDate())
                        .font(.headline)
                }
                
                NavigationLink(destination: GenresDetails(genreId: vinyl.genre_id)) {
                    if let genre = genre.first (where: {$0.id == vinyl.genre_id}) {
                        Text(genre.name)
                            .font(.headline)
                            .padding(1)
                            
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle(vinyl.title)
        .toolbar {
            ToolbarItem {
                NavigationLink (destination: EditVinyl(vinylID: vinyl.id, collection: $collection)) {
                        Text("Edit")
                    }
                }
            }
    }
}

//#Preview {
//    NavigationView {
//        VinylDetails(vinyl: .mock)
//    }
//}

// Afficher la cover du vinyl en aut en centré
// En dessous :
// . Nom de l'album
// . Nom de l'artiste
// . Date de sortie de l'album
// . Genre de l'album
