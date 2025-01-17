//
//  VynilDetail.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI
import Supabase

struct VinylDetails: View {
    
//    @Binding var vinyl: Vinyl
    var item: Item
    @State var vinyl: Vinyl? = nil
//    @State var artist = [Artist].mock
//    @State var genre = [Genre].mock
//    @Binding var collection: ItemCollection
    
    let columns = [
        GridItem(.fixed(300))
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: item.cover_image_url ?? "https://assets.fontsinuse.com/use-media/51196/upto-700xauto/58f577f9/@2x/jpeg/C9H8-PWUIAAzbQ2-jpg-large-e.jpeg")) { image in
                    image
                        .resizable()
                    
                    
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                .background(Color.tileBackground)
                .cornerRadius(10)

              Divider()
                if let vinyl {
                    Text(vinyl.artist_id.uuidString)
                        .font(.title)
                    //.font(.system(size: 40, weight: .bold))
                        .padding(1)
                }
                
//                NavigationLink(destination: ArtistsDetails(artistId: vinyl.artist_id)) {
//                    if let artist = artist.first(where: { $0.id == vinyl.artist_id }) {
//                        Text(artist.artist_name)
//                            .font(.headline)
//                            .padding(1)
//                    }
//                    
//                }
                
//                HStack {
//                    Text("Sortie :")
//                        .font(.headline)
//                    Text(vinyl.release_date.stringValue)
//                        .font(.headline)
//                }
//                
//                NavigationLink(destination: GenresDetails(genreId: vinyl.genre_id)) {
//                    if let genre = genre.first (where: {$0.id == vinyl.genre_id}) {
//                        Text(genre.genre_name)
//                            .font(.headline)
//                            .padding(1)
//                            
//                    }
//                }
            }
        }
        
        .task {
            do {
                // vinyl = try await SupabaseService.getVinyl(itemId: item.id)
                let vinyls: [Vinyl] = try await supabase.database.from("vinyls").select().eq("item_id", value: item.id).execute().value
                vinyl = vinyls[0]
            } catch {
                print(error)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle(item.name)
//        .toolbar {
//            ToolbarItem {
//                NavigationLink (destination: EditVinyl(vinylID: vinyl.id, item: item, collection: $collection)) {
//                        Text("Edit")
//                    }
//                }
//            }
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
