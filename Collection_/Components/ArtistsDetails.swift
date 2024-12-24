//
//  ArtistsDetails.swift
//  Collection_
//
//  Created by Arnaud Hayon on 24/12/2024.
//

import SwiftUI

struct ArtistsDetails: View {
    var vinyls = [Vinyls].mock
    
    let artistId: Int
    
    let columns = [
        GridItem(.flexible(), alignment: .leading)
    ]
    
    var filteredVinyls: [Vinyls] {
        vinyls.filter { vinyl in
            vinyl.artist_id == artistId
        }
    }
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(filteredVinyls) { vinyl in
                    HStack(alignment: .center, spacing: 10) {
                        AsyncImage(url: URL(string: vinyl.cover_image_url)) { image in
                            image
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                        }
                        
                        Text(vinyl.title)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundStyle(.white)
                            .lineLimit(1)
                        
                        Spacer()
                    }
                    .padding()
                    .background(Color.init(UIColor.lightGray))
                    .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ArtistsDetails(artistId: 5)
}
