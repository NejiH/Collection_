//
//  MyCollections.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//

import SwiftUI

struct MyCollections: View {
    @State var vinyls: [Vinyls] = .mock
    
    let columns = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]

  var body: some View {
          ScrollView {
              LazyVGrid(columns: columns, spacing: 10) {
                  ForEach(vinyls) { vinyl in
                      VStack{ AsyncImage(url: URL(string: vinyl.cover_image_url)) {image in
                          image.resizable()
                              .frame(width:100, height:100)
                      } placeholder: {
                          ProgressView()
                      }
                          
                          Text(vinyl.title)
                              .font(.headline)
                      }
                  }
              }
              .padding()
              .overlay {
              if vinyls.isEmpty {
                  ProgressView()
              }
          }
      }
      
    .task {
          do {
              vinyls = try await supabase.database.from("vinyls").select().execute().value
          } catch {
            print(error)
          }
        }
  }
}

#Preview {
    MyCollections()
}
