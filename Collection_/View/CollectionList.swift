//
//  CollectionList.swift
//  Collection_
//
//  Created by Arnaud Hayon on 16/12/2024.
//

import SwiftUI

//struct CollectionList: View {
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

struct CollectionList: View {
    
    @Binding var collections: [ItemCollection]
  
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach($collections, id: \.name) { oneCollection in
                    Collections(collection: oneCollection)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            }
        }
    }


//#Preview {
//  CollectionList(collections: [
//    .init(id: 1, vinyls: .mock1, name: "Mega Collection", color: .red),
//    .init(id: 2, vinyls: .mock2, name: "Super Collection", color: .blue),
//    .init(id: 3, vinyls: .mock3, name: "Left Collection", color: .red),
//])
//}
