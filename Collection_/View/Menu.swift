//
//  Menu.swift
//  Collectionite
//
//  Created by Arnaud HAYON on 27/11/2024.
//
import SwiftUI

struct Menu: View {
    
  @State var collections: [VinylCollection] = [
//    .init(id: 1, vinyls: [], name: "Pas de nom", color: .red)
    .init(id: 1, vinyls: .mock, name: "Mega Collection", color: .red),
    .init(id: 2, vinyls: .mock, name: "Super Collection", color: .blue),
    .init(id: 3, vinyls: .mock, name: "Left Collection", color: .red),
  ]
  
    @State var selectedTab = 0
    
    var body: some View {
        TabView (selection: $selectedTab) {
            
            NavigationView {
              ContentView(collections: $collections)
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
    }
}

#Preview {
    Menu()
}
