//
//  GenresDetails.swift
//  Collection_
//
//  Created by Arnaud Hayon on 20/12/2024.
//

import SwiftUI

struct GenresDetails: View {
    
    struct ListByGenre: Identifiable {
        let item: Item
        let vinyl: Vinyl
        var id: UUID {
            item.id
        }
    }
    
    @State var genreName: String = ""
    @State var genreList: [ListByGenre] = []
    let genreId: UUID
    
    
    let columns = [
        GridItem(.flexible(), alignment: .leading)
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(genreList) { genre in
                    NavigationLink(destination: VinylDetails(item: genre.item, vinyl: genre.vinyl)) {
                        HStack(alignment: .center, spacing: 10) {
                            AsyncImage(url: URL(string: genre.item.cover_image_url ?? "")) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            
                            Text(genre.item.name)
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
            .task {
                do {
                    let vinyl_list = try await SupabaseService.shared.getAllVinylsByGenre(genreId: genreId)
                    for vinyl in vinyl_list {
                        let item = await SupabaseService.shared.getItem(itemId: vinyl.item_id)
                        if let item {
                            genreList.append(ListByGenre(item: item, vinyl: vinyl))
                        }
                    }
                    genreName = try await SupabaseService.shared.getGenre(genreId: genreId).genre_name
                } catch {
                    print("Error fetching vinyls: \(error)")
                }
            }
            .padding()
            .navigationTitle(genreName)
            
        }
    }
}
//#Preview {
//    let sampleGenreId = UUID()
//
//    let sampleItems = [
//        Item(
//            id: UUID(),
//            name: "Sample Vinyl 1",
//            description: "Test Vinyl 1",
//            cover_image_url: "https://via.placeholder.com/300",
//            created_at: "10-12-202",
//            updated_at: "11-11-2021",
//            collection_id: UUID()
//        ),
//        Item(
//            id: UUID(),
//            name: "Sample Vinyl 2",
//            description: "Test Vinyl 2",
//            cover_image_url: "https://via.placeholder.com/300",
//            created_at: "10-12-202",
//            updated_at: "11-11-2021",
//            collection_id: UUID()
//        )
//    ]
//    
//    let sampleVinyls = [
//        Vinyl(
//            id: UUID(),
//            barcode: 123456,
//            release_date: .now,
//            created_at: .now,
//            updated_at: .now,
//            genre_id: UUID(),
//            artist_id: UUID(),
//            item_id: sampleItems[0].id
//        ),
//        Vinyl(
//            id: UUID(),
//            barcode: 123456,
//            release_date: .now,
//            created_at: .now,
//            updated_at: .now,
//            genre_id: UUID(),
//            artist_id: UUID(),
//            item_id: sampleItems[1].id
//        )
//    ]
//    
//    let sampleListByGenre = zip(sampleItems, sampleVinyls).map { ListByGenre(item: $0, vinyl: $1) }
//    
//    NavigationStack {
//        GenresDetails(genreName: "Rock", genreList: sampleListByGenre, genreId: sampleGenreId)
//    }
//}
