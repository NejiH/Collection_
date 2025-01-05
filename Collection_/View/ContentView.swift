//
//  ContentView.swift
//  Collection_
//
//  Created by Arnaud Hayon on 16/12/2024.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            Text("")
//        }
//        .padding()
//    }
//}

struct ContentView: View {
    
    @State var collections: [VinylCollection]
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(collections, id: \.name) { oneCollection in
                    MyCollections(collection: oneCollection)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        }
    }
    
}


#Preview {
  ContentView(collections: [
    .init(vinyls: .mock1, name: "Mega Collection", color: .red),
    .init(vinyls: .mock2, name: "Super Collection", color: .blue),
    .init(vinyls: .mock3, name: "Left Collection", color: .red),
])
}
