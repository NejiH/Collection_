//
//  MyCollections.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//

import SwiftUI

struct MyItems: View {
    @State var vinyls: [Vinyls] = .mock
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
       
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(vinyls) { vinyl in
                        NavigationLink(destination: ItemsDetails(vinyl: vinyl)) {
                            VStack {
                                AsyncImage(url: URL(string: vinyl.cover_image_url)) {image in
                                    image.resizable()

                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width:100, height:100)
                                .background(Color.tileBackground)
                                .cornerRadius(10)

                              Text(vinyl.title)
                                    .font(.headline)
                                    .foregroundStyle(.black)
                                    .lineLimit(1)

                            }
                        }
                    }
                }
            }
            .padding()
            .overlay {
                if vinyls.isEmpty {
                    ProgressView()
                }
            }
            
            
//            .task {
//                do {
//                    vinyls = try await supabase.database.from("vinyls").select().execute().value
//                } catch {
//                    print(error)
//                }
//            }
    }
}

#Preview {
    NavigationView {
        MyItems()
    }
}
