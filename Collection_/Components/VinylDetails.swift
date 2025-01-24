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
    @State var artist: Artist? = nil
    @State var genre: Genre? = nil
    
    //    @State var artist = [Artist].mock
    //    @State var genre = [Genre].mock
    //    @Binding var collection: ItemCollection
    
    let columns = [
        GridItem(.fixed(300))
    ]
    
   
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: item.cover_image_url ?? "default_image")) { image in
                    image
                        .resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                .background(Color.tileBackground)
                .cornerRadius(10)
                
                Divider()
                
                Text(item.name)
                    .font(.title)
                    .padding(1)
                
                NavigationLink(destination: ArtistsDetails(item: item, vinyls: [], artists: [], artistId: vinyl?.artist_id ?? UUID())) {
                    if let artist {
                        Text(artist.artist_name)
                            .font(.headline)
                            .padding(1)
                    }
                }
               
                
                if let genre {
                    Text(genre.genre_name)
                        .font(.headline)
                        .padding(1)
                }
                
                if let vinyl {
                    Text(vinyl.formattedReleaseDate)
                        .font(.headline)
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
    
    //        .task {
    //            do {
    //                // vinyl = try await SupabaseService.getVinyl(itemId: item.id)
    //                let vinyls: [Vinyl] = try await supabase.database.from("vinyls").select().eq("item_id", value: item.id).execute().value
    //                vinyl = vinyls[0]
    //            } catch {
    //                print(error)
    //            }
    //        }
        .task { // update la base de données après le rechargement de la page - next step: A modifier pour le passer en onAppear
            do {
                if let fetchedVinyl = await SupabaseService.shared.getVinyl(itemId: item.id) {
                    vinyl = fetchedVinyl
                    let fetchedArtist = try await SupabaseService.shared.getArtist(artistId: fetchedVinyl.artist_id)
                    artist = fetchedArtist
                    let fetchedGenre = try await SupabaseService.shared.getGenre(genreId: fetchedVinyl.genre_id)
                    genre = fetchedGenre
                }
            } catch {
                print("Error fetching vinyl: \(error)")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle(item.name)
            .toolbar {
                ToolbarItem {
                    NavigationLink (destination: EditVinyl(itemId: item.id)) {
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
