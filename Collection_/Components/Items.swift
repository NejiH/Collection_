//
//  MyCollections.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//

import SwiftUI

struct MyItems: View {
  
  @Binding var collection: VinylCollection
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
       
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                  ForEach($collection.vinyls) { vinyl in
                      NavigationLink(destination: ItemsDetails(vinyl: vinyl, collection: $collection)) {
                            VStack {
                                AsyncImage(url: URL(string: vinyl.wrappedValue.cover_image_url)) {image in
                                    image.resizable()

                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width:100, height:100)
                                .background(Color.tileBackground)
                                .cornerRadius(10)

                              Text(vinyl.wrappedValue.title)
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
              if collection.vinyls.isEmpty {
                    ProgressView()
                }
            }
            .navigationTitle("Mes Items")
            .toolbar {
                ToolbarItem {
                    NavigationLink (destination: EditItem(collection: $collection)) {
                            Text("Add")
                        }
                    }
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

#Preview {
  @Previewable @State var collection = VinylCollection(id: 1, vinyls: .mock, name: "Mega Collection", color: .red)
    NavigationView {
        MyItems(collection: $collection)
    }
}
