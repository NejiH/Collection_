//
//  EditVinyl.swift
//  Collection_
//
//  Created by Arnaud Hayon on 05/01/2025.
//

import SwiftUI

struct EditVinyl: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var vinyl: Vinyl
    @State var item: Item
    @Binding var collection: ItemCollection
    let vinylID: UUID

    init(vinylID: UUID? = nil, item: Item, collection: Binding<ItemCollection>) {
        // On n'a plus besoin de gérer un ID incrémental car on utilise des UUID
        let newID = vinylID ?? UUID()
        self.vinylID = newID
        
        // Chercher le vinyl existant ou en créer un nouveau
        if let existingVinyl = collection.wrappedValue.vinyls.first(where: { $0.id == newID }) {
            self.vinyl = existingVinyl
        } else {
            // Création d'un nouveau Vinyl avec les champs requis
            self.vinyl = Vinyl(
                id: newID,
                barcode: 0, // valeur par défaut
                cover_image_url: "",
                release_date: Date(),
                created_at: Date(),
                updated_at: nil,
                genre_id: UUID(), // vous pourriez vouloir utiliser un genre par défaut
                artist_id: UUID(), // vous pourriez vouloir utiliser un artiste par défaut
                item_id: UUID()
            )
        }
        
        self.item = item  
        self._collection = collection
    }
  
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                TextField("Title", text: $item.name)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
              
                DatePicker(selection: $vinyl.release_date, in: ...Date.now, displayedComponents: .date) {
                    Text("Release date")
                }
                DatePicker(selection: $vinyl.created_at, in: ...Date.now, displayedComponents: .date) {
                    Text("Created at")
                }
                
                HStack {
                    Text("Artist")
                    Spacer()
                    Picker("Artist", selection: $vinyl.artist_id) {
                        ForEach([Artist].mock) {
                            Text($0.artist_name)
                        }
                    }
                }
                
                HStack {
                    Text("Genre")
                    Spacer()
                    Picker("Genre", selection: $vinyl.genre_id) {
                        ForEach([Genre].mock) {
                            Text($0.genre_name)
                        }
                    }
                }
                
                TextField("Cover Image", text: $vinyl.cover_image_url)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                
                AsyncImage(url: URL(string: vinyl.cover_image_url)) { image in
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
                    collection.vinylsData[vinylID] = vinyl
                    dismiss()
                } label: {
                    Text("Save")
                }
          }
        }
    }
}

//#Preview("Add") {
//  EditVinyl(collectionID: 42)
//}
//
//#Preview("Edit") {
//  EditVinyl(collectionID: 44, vinyl: .mock)
//}
