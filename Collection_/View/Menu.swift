//
//  Menu.swift
//  Collectionite
//
//  Created by Arnaud HAYON on 27/11/2024.
//
import SwiftUI

struct Menu: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        TabView (selection: $selectedTab) {
            
            NavigationView {
                ContentView()
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
            
            AddItem()
                .tabItem {
                    Image(systemName: "rectangle.fill.badge.plus")
                    Text("Ajouter un item")
                }
                .tag(2)
        }
    }
}
#Preview {
    Menu()
}



