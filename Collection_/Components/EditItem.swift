//
//  EditItem.swift
//  Collection_
//
//  Created by Arnaud Hayon on 05/01/2025.
//

import SwiftUI

struct EditItem: View {
    
    @State var item: Vinyls
    
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                TextField("Title", text: $item.title)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                DatePicker(selection: $item.release_date, in: ...Date.now, displayedComponents: .date) {
                    Text("Release date")
                }
                DatePicker(selection: $item.created_at, in: ...Date.now, displayedComponents: .date) {
                    Text("Created at")
                }
                
                Picker("Artist", selection: $item.artist_id) {
                    ForEach([Artist].mock) {
                        Text($0.name)
                    }
                }
                
                Picker("Genre", selection: $item.genre_id) {
                    ForEach([Genre].mock) {
                        Text($0.name)
                    }
                }
                
                TextField("Cover Image", text: $item.cover_image_url)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                
                AsyncImage(url: URL(string: item.cover_image_url)) { image in
                    image
                    //                        .frame(width: 50, height: 50)
                } placeholder: {
                    ProgressView()
                }
                
            }
            .padding()
        }
        
        
    }
}

#Preview {
    NavigationView{EditItem(item: .mock)}
}
