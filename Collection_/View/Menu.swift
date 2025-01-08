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
        TabView (selection: $selectedTab) {
            
            NavigationView {
//                if collections == nil {
//                    ProgressView()
//                } else if let collections, collections.isEmpty {
//                    ContentUnavailableView(
//                        "No Collection Found",
//                        systemImage: "tray",
//                        description: Text("Please consider adding your first collection.")
//                    )
//                } else if let collections {
//                    ForEach(collections) {
//                        Text($0.name)
//                    }
//                }
                    
                CollectionList(collections: $oldCollections)
            }
            .tabItem {
                Image(systemName: "list.bullet.rectangle.fill")
                Text("Mes collections")
            }
            .tag(0)
            
            AddCollection()
                .tabItem {
                    Image(systemName: "rectangle.stack.fill.badge.plus")
                    Text("Ajouter une collection")
                }
                .tag(1)
            
            
//            NavigationView {
//                EditVinyl(item: item)
//            }
//            .tabItem {
//                Image(systemName: "rectangle.fill.badge.plus")
//                Text("Ajouter un item")
//            }
//            .tag(2)
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
