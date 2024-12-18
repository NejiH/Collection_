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
    
    @State var collections: [VinylCollection] = [
        .init(vinyls: .mock, name: "Super Collection", color: .red),
        .init(vinyls: .mock, name: "Mega Collection", color: .blue)
    ]
    
    var body: some View {
        List(collections, id: \.name) { oneCollection in
            MyCollections(collection: oneCollection)
        }
    }
}

#Preview {
    ContentView()
}
