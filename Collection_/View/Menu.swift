//
//  Menu.swift
//  Collectionite
//
//  Created by Arnaud HAYON on 27/11/2024.
//
import SwiftUI
import Supabase

struct Menu: View {
    
    @State var oldCollections: [ItemCollection] = [
        //    .init(id: 1, vinyls: [], name: "Pas de nom", color: .red)
        .init(id: 1, vinyls: .mock, name: "Mega Collection", color: .red),
        .init(id: 2, vinyls: .mock, name: "Super Collection", color: .blue),
        .init(id: 3, vinyls: .mock, name: "Left Collection", color: .red),
    ]
    
    @State var collections: [Collections]? = nil
    
    @State var selectedTab = 0
    
    var body: some View {
            NavigationView {
                //                if collections == nil {
                //                    ProgressView()
                //                } else if let collections, collections.isEmpty {
                //                    ContentUnavailableView(
                //                        "No Collection Found",
                //                        systemImage: "tray",
                //                        description: Text("Please consider adding your first collection.")
                //                    )
                //
                //                } else if let collections {
                //                    ForEach(collections) {
                //                        Text($0.name)
                //                    }
                //                }
                
                CollectionList(collections: $oldCollections)
                    .navigationTitle("Mes Collections") 
                    .toolbar {
                        ToolbarItem {
                            NavigationLink (destination: AddCollection()) {
                                Text("Add")
                            }
                        }
                    }
            }
          
        .task {
            do {
                collections = try await supabase.database.from("collections")
                    .select().execute().value
                print(collections)
            } catch {
                dump(error)
            }
        }
    }
}

#Preview {
    Menu()
}
