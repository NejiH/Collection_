//
//  MyItems.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI

struct MyCollections: View {
    
    @State var collection: VinylCollection
    
    var body: some View {
        
        VStack {
            if let firstVinyl = collection.vinyls.first {
                NavigationLink(destination: MyItems()) {
                    AsyncImage(url: URL(string: firstVinyl.cover_image_url)) { image in
                        image
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            .padding(0)
                    } placeholder: {
                        ProgressView()
                    }
                }
                Text(collection.name)
                    .font(.headline)
            }
        }
        .navigationTitle(collection.name)
    }
}
#Preview {
    MyCollections(collection: .init(vinyls: .mock, name: "Mes vinyls", color: .red))
}
