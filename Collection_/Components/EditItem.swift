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
    @Binding var collection: VinylCollection
    let vinylID: Int
    
    init(vinylID: Int? = nil, collection: Binding<VinylCollection>) {
//        var biggestPossibleID = 11
        var biggestPossibleID = vinylID ?? -1
        print("biggestPossibleID:", biggestPossibleID)
        if vinylID == nil {
            biggestPossibleID = collection.vinyls.reduce(into: -1) { partialResult, vinyl in
                if vinyl.id > partialResult {
                    partialResult = vinyl.id
                }
            }
            biggestPossibleID += 1
            print("> biggestPossibleID:", biggestPossibleID)
            if collection.vinyls.isEmpty {
                biggestPossibleID = 1
            }
        }
        print("@ biggestPossibleID:", biggestPossibleID)
        self.vinylID = biggestPossibleID
        self.item = collection.wrappedValue.vinyls.first(where: { $0.id == biggestPossibleID }) ?? Vinyls(id: biggestPossibleID)
        self._collection = collection
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
                    collection.vinylsData[vinylID] = item
                    dismiss()
                } label: {
                    Text("Save")
                }
          }
        }
    }
}

//#Preview("Add") {
//  EditItem(collectionID: 42)
//}
//
//#Preview("Edit") {
//  EditItem(collectionID: 44, item: .mock)
//}
