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
            ZStack (alignment: .top){
                Image("disc-vinyl")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 150, height: 100)
                                .padding(.leading, 30)
                                
                    AsyncImage(url: URL(string: imageUrl)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 100, height: 100)
                    .background(Color.tileBackground)
                    .clipShape(
                        .rect(
                            topLeadingRadius: 10,
                            bottomLeadingRadius: 10,
                            bottomTrailingRadius: 0,
                            topTrailingRadius: 0
                        )
                    )
                   
                }
                .frame(maxWidth: .infinity) // < Pour aligner les éléments tout à gauche
            Text(title)
                .font(.headline)
                .foregroundStyle(.black)
                .lineLimit(1)
                }
        }
    }


#Preview(traits: .sizeThatFitsLayout) {
    VinylCell(
        imageUrl: "https://via.placeholder.com/100",
        title: "Sample Vinyl"
    )
    .padding()
}
