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
                    AddItem(name: "", description: "", cover_image_url: "", collection_id: collection.id)
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


//#Preview {
//    @State var collection = ItemCollection(id: 1, vinyls: .mock, name: "Mega Collection", color: .red)
//    @State var items: [Item] = .mock
//
//    NavigationView {
//        VinylList(collection: $collection, items: $items)
//    }
//}
