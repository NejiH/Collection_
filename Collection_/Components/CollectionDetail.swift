//
//  VinylList.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI
import Supabase

struct CollectionDetail: View {
    
    var collection: Collection
    @State var items: [Item] = []
    
    var body: some View {
        
            HStack {
                if items.isEmpty {
                    NavigationLink (destination: AddItem(name: "", description: "", cover_image_url: "", collection_id: UUID(), barcode: 123456, release_date: .now, created_at: .now, updated_at: .now, genre_id: UUID(), artist_id: UUID(), item_id: UUID())) {
                        VStack {
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                            
                            Text(collection.name)
                                .font(.headline)
                                .foregroundStyle(.gray)
                                .lineLimit(1)
                        }
                    }
                    
                } else {
                    NavigationLink(destination: VinylList(collection: collection)) {
                        VStack {
                            if let randomCoverImageURL = items.randomElement()?.cover_image_url,
                               let url = URL(string: randomCoverImageURL) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 100, height: 100)
                                .background(Color.tileBackground)
                                .cornerRadius(10)
                                
                                Text(collection.name)
                                    .font(.headline)
                                    .foregroundStyle(.black)
                                    .lineLimit(1)
                            }
                        }
                    }
                }
        }
        .navigationTitle("Mes Collections")
        .onAppear {
            Task {
                do {
                    items = try await supabase.database.from("items").select().eq("collection_id", value: collection.id).execute().value
                } catch {
                    print(error)
                }
            }
        }
        
    }
}
#Preview {
    let previewCollectionId = UUID(uuidString: "8492bc2f-722d-40ba-96e2-0e6ad582c096")!
    
    NavigationStack {
        CollectionDetail(
            collection: Collection(
                id: previewCollectionId,
                name: "Mes vinyls",
                created_at: "2025-03-04",
                updated_at: nil
            )
        )
    }
    
}
