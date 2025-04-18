//
//  Menu.swift
//  Collectionite
//
//  Created by Arnaud HAYON on 27/11/2024.
//
import SwiftUI
import Supabase

struct Menu: View {
//    
//  @State var oldCollections: [ItemCollection] = [
////    .init(id: 1, vinyls: [], name: "Pas de nom", color: .red)
//    .init(id: 1, vinyls: .mock, name: "Mega Collection", color: .red),
//    .init(id: 2, vinyls: .mock, name: "Super Collection", color: .blue),
//    .init(id: 3, vinyls: .mock, name: "Left Collection", color: .red),
//  ]
    
    @State var collections: [Collection] = []
  
    @State var selectedTab = 0
    
    var body: some View {
        
        NavigationView {
            if collections.isEmpty {
                                ProgressView()
                            } else {
                                CollectionList(collections: collections)
                            }
            
//            CollectionList(collections: $oldCollections, items: $items)
            
        }

        .task {
            do {
                collections = try await supabase.database.from("collections")
                    .select().execute().value
//                print(collections)

            } catch {
                dump(error)
            }
        }
    }
}

#Preview {
    Menu()
}
