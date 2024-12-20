//
//  VynilDetail.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI

struct ItemsDetails: View {
    
    @State var vinyl: Vinyls
    @State var artist = [Artist].mock
    @State var genre = [Genre].mock
    
    let columns = [
        GridItem(.fixed(300))
    ]
    
    var body: some View {
            LazyVGrid(columns: columns, spacing: 10) {
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: vinyl.cover_image_url)) { image in
                        image
                            .resizable()
                            .frame(width: 300, height: 300)
                            .cornerRadius(10)
                            .padding(0)
                    } placeholder: {
                        ProgressView()
                    }
                Divider()
                Text(vinyl.title)
                    .font(.system(size: 40, weight: .bold))
                    .minimumScaleFactor(0.2)
                    .lineLimit(1)
                    .padding(1)
                if let artist = artist.first (where: { $0.id == vinyl.artist_id }) {
                    Text(artist.name)
                        .font(.system(size: 30, weight: .medium))
                        .padding(1)
                 }
                Text("Sortie : ")
                    .font(.system(size: 20, weight: .bold)) +
                Text(vinyl.release_date.formattedDate())
                    .font(.system(size: 20, weight: .light))
                if let genre = genre.first (where: {$0.id == vinyl.genre_id}) {
                    Text(genre.name)
                        .font(.system(size: 20, weight: .medium))
                        .padding(1)
                }
                
            }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
       }
   }

#Preview {
    ItemsDetails(vinyl: .mock)
}

// Afficher la cover du vinyl en aut en centré
// En dessous :
// . Nom de l'album
// . Nom de l'artiste
// . Date de sortie de l'album
// . Genre de l'album
