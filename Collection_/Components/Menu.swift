//
//  Menu.swift
//  Collectionite
//
//  Created by Arnaud HAYON on 27/11/2024.
//
import SwiftUI

struct MyCollectionsView: View {
    var body: some View {
        MyCollections()
    }
}

struct AddCollectionView: View {
    var body: some View {
        AddCollection()
    }
}

struct AddItemView: View {
    var body: some View {
        AddItem()
    }
}

struct Menu: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        HStack{
            TabView (selection: $selectedTab) {
                
                MyCollectionsView()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle.fill")
                        Text("My collections")
                    }
                    .tag(0)
                
                AddCollectionView()
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill.badge.plus")
                        Text("Add a collection")
                    }
                    .tag(1)
                
                AddItemView()
                    .tabItem {
                        Image(systemName: "rectangle.fill.badge.plus")
                        Text("Add an item")
                    }
                    .tag(2)
            }
        }
    }
}
#Preview {
    Menu()
}



