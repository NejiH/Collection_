//
//  VinylCell.swift
//  Collection_
//
//  Created by Arnaud Hayon on 16/01/2025.
//

import SwiftUI

struct VinylCell: View {
    let imageUrl: String
    let title: String
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .background(Color.tileBackground)
            .cornerRadius(10)
            
            Text(title)
                .font(.headline)
                .foregroundStyle(.black)
                .lineLimit(1)
        }
    }
}

//#Preview {
//    VinylCell(
//            vinyl: Vinyl(
//                id: UUID(),
//                barcode: 123456789,
//                cover_image_url: "https://example.com/cover.jpg",
//                release_date: Date(),
//                created_at: Date(),
//                updated_at: nil,
//                genre_id: UUID(),
//                artist_id: UUID(),
//                item_id: UUID()
//            ),
//            item: Item(
//                id: UUID(),
//                name: "Album Example",
//                description: "Description de l'album",
//                cover_image_url: nil,
//                created_at: 0,
//                updated_at: 0,
//                collection_id: UUID()
//            )
//        )}
