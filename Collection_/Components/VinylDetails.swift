//
//  VynilDetail.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI
import Supabase

struct VinylDetails: View {
    
    @Environment(\.dismiss) var dismiss
    
    var item: Item
    @State var vinyl: Vinyl? = nil
    @State var artist: Artist? = nil
    @State var genre: Genre? = nil
    @State private var updateTrigger = UUID()
    
    let columns = [
        GridItem(.fixed(300))
    ]
    
    func fetchVinylDetails() {
        Task {
            do {
                if let fetchedVinyl = await SupabaseService.shared.getVinyl(itemId: item.id) {
                    vinyl = fetchedVinyl
                    artist = try await SupabaseService.shared.getArtist(artistId: fetchedVinyl.artist_id)
                    genre = try await SupabaseService.shared.getGenre(genreId: fetchedVinyl.genre_id)
                }
            } catch {
                print("Error fetching vinyl: \(error)")
            }
        }
    }
    
    
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
                
                
                NavigationLink(destination: ArtistsDetails(artistId: vinyl?.artist_id ?? UUID())) {
                    if let artist {
                        Text(artist.artist_name)
                            .font(.headline)
                            .padding(1)
                    }
                }
                
                NavigationLink(destination: GenresDetails(genreId: vinyl?.genre_id ?? UUID())) {
                    if let genre {
                        Text(genre.genre_name)
                            .font(.headline)
                            .padding(1)
                    }
                }
                
                if let vinyl {
                    Text(vinyl.formattedReleaseDate)
                        .font(.headline)
                        .padding(1)
                }
                
                Button {
                    Task {
                        do {
                            _ = try await SupabaseService.shared.deleteItem(item.id)
                            dismiss()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                } label: {
                    Text("Supprimer")
                }
                
            }
        }
        .onAppear {
            fetchVinylDetails()
        }
        .onChange(of: updateTrigger, initial: false) { _,_  in
            fetchVinylDetails()
        }
        
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .navigationTitle(item.name)
        .toolbar {
            ToolbarItem {
                NavigationLink(destination: EditVinyl(updateTrigger: $updateTrigger, itemId: item.id)) {
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
