//
//  ArtistsDetails.swift
//  Collection_
//
//  Created by Arnaud Hayon on 24/12/2024.
//

import SwiftUI
import Supabase

struct ArtistsDetails: View {
    
    var item: Item
    @State var vinyls: [Vinyl] = []
    @State var artists: [Artist]
    let artistId: UUID

    let columns = [
        GridItem(.flexible(), alignment: .leading)
    ]

//    var filteredVinyls: [Vinyl] {
//        vinyls.filter { $0.artist_id == artistId }
//    }
    
    var filteredVinyls: [Vinyl] {
        vinyls.filter { vinyl in
            print("Comparing: \(vinyl.artist_id) == \(artistId)")
            return vinyl.artist_id == artistId
        }
    }
    

    var artistName: String {
        artists.first(where: { $0.id == artistId })?.artist_name ?? "Artist"
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(filteredVinyls) { vinyl in
                    NavigationLink(destination: VinylDetails(item: item, vinyl: vinyl)) {
                        HStack(alignment: .center, spacing: 10) {
                            AsyncImage(url: URL(string: item.cover_image_url ?? "")) { image in
                                image
                                    .resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            
                            
//                            Text(item.title)
//                                .font(.title2)
//                                .fontWeight(.heavy)
//                                .foregroundStyle(.white)
//                                .lineLimit(1)
                            Text("coucou")
                           
                            
                            Spacer()
                        }
                        .padding()
                        .background(Color.tileBackground)
                        .cornerRadius(10)
                    }
                }
            }
            
            .task {
                print("ArtistID: \(artistId)")
                do {
                    vinyls = try await SupabaseService.shared.getAllVinylsFromArtist(artistId: artistId)
                    print("Fetched vinyls count: \(vinyls.count)")
                    print("Filtered vinyls count: \(filteredVinyls.count)")
                } catch {
                    print("Error fetching vinyls: \(error)")
                }
            }
                .padding()
        }
        .navigationTitle(artistName)
    }
}

//#Preview {
//    ArtistsDetails(artistId: UUID(uuidString: "7G0L9I8H-4J3K-0L2G-5H8I-1K9J4G3I7L0K")!)
//}
