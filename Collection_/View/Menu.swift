//
//  Menu.swift
//  Collectionite
//
//  Created by Arnaud HAYON on 27/11/2024.
//
import SwiftUI

struct Menu: View {
    
  @State var collections: [VinylCollection] = [
    .init(id: 1, vinyls: .mock1, name: "Mega Collection", color: .red),
    .init(id: 2, vinyls: .mock2, name: "Super Collection", color: .blue),
    .init(id: 3, vinyls: .mock3, name: "Left Collection", color: .red),
  ]
  
    @State var selectedTab = 0
    
    var body: some View {
        TabView (selection: $selectedTab) {
            
            NavigationView {
              ContentView(collections: collections)
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
//                EditItem(item: item)
//            }
//            .tabItem {
//                Image(systemName: "rectangle.fill.badge.plus")
//                Text("Ajouter un item")
//            }
//            .tag(2)
        }
        .onReceive(NotificationCenter.default.publisher(for: .addOrEditItem)) { note in
          guard
            let collectionID = note.userInfo?["collectionID"] as? Int,
            var item = note.userInfo?["item"] as? Vinyls
          else { return }
          var localCollection = collections.reduce(into: [Int: VinylCollection]()) { partialResult, vinylCollection in
            partialResult[vinylCollection.id] = vinylCollection
          }

          // Si on n'a pas d'ID correct
          if item.id == -1 {
            var biggestID = -1
            for element in localCollection[collectionID]?.vinyls ?? [] {
              if element.id > biggestID {
                biggestID = element.id
              }
            }
            item.id = biggestID + 1
          }
          
          localCollection[collectionID]?.vinyls.append(item)
          collections = Array(localCollection.values)
        }
    }
}

#Preview {
    Menu()
}
