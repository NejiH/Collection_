//
//  CollectionDetail.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//

import SwiftUI
import Supabase

struct VinylList: View {
    
    var collection: Collection
    @State var items: [Item] = []
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    func vinylLink(item: Item) -> some View {
        NavigationLink {
            VinylDetails(
                item: item
            )
        } label: {
            VinylCell(imageUrl: item.cover_image_url ?? "https://assets.fontsinuse.com/use-media/51196/upto-700xauto/58f577f9/@2x/jpeg/C9H8-PWUIAAzbQ2-jpg-large-e.jpeg", title: item.name)
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                
                ForEach(items) { item in
                    vinylLink(item: item)
                }
            }
        }
        .padding()
        .overlay {
            if items.isEmpty {
                ProgressView()
            }
        }
        .navigationTitle("Mes Items")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    AddItem(name: "", description: "", cover_image_url: "", collection_id: UUID(), barcode: 123456, release_date: .now, created_at: .now, updated_at: .now, genre_id: UUID(), artist_id: UUID(), item_id: UUID())
                } label: {
                    Text("Add")
                }
            }
        }
        .onAppear {
            Task {
                do {
                    items = try await SupabaseService.shared.getItems(collectionId: collection.id)
                } catch {
                    print(error)
                }
            }
        }
        
    }
}


#Preview {
    @Previewable @State var sampleCollection = Collection(
        id: UUID(),
        name: "Ma Collection",
        created_at: "10-12-2022",
        updated_at: "10-12-2022"
    )
    
    @Previewable @State var sampleItems = [
        Item(
            id: UUID(),
             name: "Sample Vinyl 1",
             description: "Test Vinyl 1",
             cover_image_url: "https://via.placeholder.com/300",
             created_at: "10-12-202",
             updated_at: "11-11-2021",
             collection_id: UUID()),
        Item(id: UUID(),
             name: "Sample Vinyl 2",
             description: "Test Vinyl 2",
             cover_image_url: "https://via.placeholder.com/300",
             created_at: "10-12-202",
             updated_at: "11-11-2021",
             collection_id: UUID())
    ]
    
    return NavigationStack {
        VinylList(collection: sampleCollection, items: sampleItems)
    }
}
