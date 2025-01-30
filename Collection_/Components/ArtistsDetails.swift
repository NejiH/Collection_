//
//  ArtistsDetails.swift
//  Collection_
//
//  Created by Arnaud Hayon on 24/12/2024.
//

import SwiftUI
import Supabase

struct ArtistsDetails: View {
    
    struct ArtistWork: Identifiable {
        let item: Item
        let vinyl: Vinyl
        var id: UUID {
            item.id
        }
    }
    
    @State var artistName: String = ""
    @State var works: [ArtistWork] = []
    let artistId: UUID

    let columns = [
        GridItem(.flexible(), alignment: .leading)
    ]
    
    internal init(artistId: UUID) {
        self.artistId = artistId
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(works) { work in
                    NavigationLink(destination: VinylDetails(item: work.item, vinyl: work.vinyl)) {
                        HStack(alignment: .center, spacing: 10) {
                            AsyncImage(url: URL(string: work.item.cover_image_url ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            
                            Text(work.item.name)
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
            }
            .onAppear {
                Task {
                    do {
                        let vinyl_list = try await SupabaseService.shared.getAllVinylsByArtist(artistId: artistId)
                        for vinyl in vinyl_list {
                            let item = await SupabaseService.shared.getItem(itemId: vinyl.item_id)
                            if let item {
                                works.append(ArtistWork(item: item, vinyl: vinyl))
                            }
                        }
                        artistName = try await SupabaseService.shared.getArtist(artistId: artistId).artist_name
                    } catch {
                        print("Error fetching vinyls: \(error)")
                    }
                }

            }
            .padding()
        }
        .navigationTitle(artistName)
    }
}

//#Preview {
//    ArtistsDetails(artistId: <#T##UUID#>)
//}
