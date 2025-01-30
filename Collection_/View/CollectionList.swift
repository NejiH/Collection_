//
//  CollectionList.swift
//  Collection_
//
//  Created by Arnaud Hayon on 16/12/2024.
//

import SwiftUI

struct CollectionList: View {
    
    var collections: [Collection]
  
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                // Collections existantes
                ForEach(collections, id: \.name) { collection in
                    CollectionDetail(collection: collection)
                }
                
                NavigationLink (destination: AddCollection()) {
                    HStack {
                        VStack {
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                            
                            Text("Nouvelle collection")
                                .font(.headline)
                                .foregroundStyle(.gray)
                                .lineLimit(1)
                        }
                    }
                }
                
            }
            .padding()
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
