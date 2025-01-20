//
//  VinylList.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI
import Supabase

struct CollectionDetail: View {
    
    var collection: Collection
    @State var items: [Item] = []
    
    var body: some View {
        HStack {
            if items.isEmpty {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .background(Color.tileBackground)
                    .cornerRadius(10)
            } else {
                NavigationLink(destination: VinylList(collection: collection)) {
                    VStack {
                        if let randomCoverImageURL = items.randomElement()?.cover_image_url,
                           let url = URL(string: randomCoverImageURL) {
                            AsyncImage(url: url) { image in
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

    }
        .navigationTitle("Mes Collections")
        .task {
            do {
                items = try await supabase.database.from("items").select().eq("collection_id", value: collection.id).execute().value
            } catch {
                print(error)
            }
        }

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
