//
//  VinylList.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI

struct CollectionDetail: View {
    
    @Binding var collection: ItemCollection
    
    var body: some View {
        HStack {
            if let firstVinyl = collection.vinyls.first {
                NavigationLink(destination: VinylList(collection: $collection)) {
                    VStack {
                        AsyncImage(url: URL(string: firstVinyl.cover_image_url)) { image in
                            image
                                .resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        .background(Color.tileBackground)
                        .cornerRadius(10)

                      Text(collection.name)
                            .font(.headline)
                            .foregroundStyle(.black)
                            .lineLimit(1)
                    }
                }
            }
        }
        .navigationTitle("Mes Collections")
    }
}
//#Preview {
//  CollectionDetail(
//    collection: ItemCollection(
//      id: 43,
//      vinyls: .mock1,
//      name: "Coucou",
//      color: .red
//    )
//  );
//  CollectionDetail(
//    collection: ItemCollection(
//      id: 44,
//      vinyls: .mock2,
//      name: "Pouet",
//      color: .blue
//    )
//  )
//}
