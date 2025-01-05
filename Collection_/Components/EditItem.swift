//
//  EditItem.swift
//  Collection_
//
//  Created by Arnaud Hayon on 05/01/2025.
//

import SwiftUI

struct EditItem: View {
    
  @Environment(\.dismiss) var dismiss
  
  @State var item: Vinyls
  let collectionID: Int
  
  init(collectionID: Int, item: Vinyls = Vinyls()) {
    self.item = item
    self.collectionID = collectionID
  }
  
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
                
                HStack {
                    Text("Artist")
                    Spacer()
                    Picker("Artist", selection: $item.artist_id) {
                        ForEach([Artist].mock) {
                            Text($0.name)
                        }
                    }
                }
                
                HStack {
                    Text("Genre")
                    Spacer()
                    Picker("Genre", selection: $item.genre_id) {
                        ForEach([Genre].mock) {
                            Text($0.name)
                        }
                    }
                }
                
                TextField("Cover Image", text: $item.cover_image_url)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                
                AsyncImage(url: URL(string: item.cover_image_url)) { image in
                    image
                        .resizable()
                        .frame(width: 300, height: 300)
                    
                } placeholder: {
                    ProgressView()
                 }
                
                
            }
            .padding()
        }
        .toolbar {
          ToolbarItem {
            Button {
              NotificationCenter.default
                .post(
                  name: .addOrEditItem,
                  object: nil,
                  userInfo: [
                    "collectionID": collectionID,
                    "item": item
                  ]
                )
              dismiss()
            } label: {
              Text("Save")
            }
          }
        }
    }
}

#Preview("Add") {
  EditItem(collectionID: 42)
}

#Preview("Edit") {
  EditItem(collectionID: 44, item: .mock)
}
