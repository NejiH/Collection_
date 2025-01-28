//
//  EditVinyl.swift
//  Collection_
//
//  Created by Arnaud Hayon on 05/01/2025.
//

import SwiftUI

struct EditVinyl: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var artists: [Artist] = []
    @State var genres: [Genre] = []
    @State var imageURL: String = ""
    
    @State var vinyl: Vinyl = Vinyl(id: UUID(), barcode: 0, release_date: .now, created_at: .now, updated_at: nil, genre_id: UUID(), artist_id: UUID(), item_id: UUID())
    @State var item: Item = Item(id: UUID(), name: "", description: "", cover_image_url: nil, created_at: "", updated_at: nil, collection_id: UUID())
    //    @Binding var collection: ItemCollection
    
    let itemId: UUID?
    @State var hasLoadedData = false

    init(itemId: UUID? = nil) {
        self.itemId = itemId
        
        //        // Chercher le vinyl existant ou en créer un nouveau
        //        if let existingVinyl = collection.wrappedValue.vinyls.first(where: { $0.id == newID }) {
        //            self.vinyl = existingVinyl
        //        } else {
        //            // Création d'un nouveau Vinyl avec les champs requis
        //            self.vinyl = Vinyl(
        //                id: newID,
        //                barcode: 0, // valeur par défaut
        //                cover_image_url: "",
        //                release_date: Date(),
        //                created_at: Date(),
        //                updated_at: nil,
        //                genre_id: UUID(), // vous pourriez vouloir utiliser un genre par défaut
        //                artist_id: UUID(), // vous pourriez vouloir utiliser un artiste par défaut
        //                item_id: UUID()
        //            )
        //        }
        //
        //        self.item = item
        //        self._collection = collection
    }
    
    
    var body: some View {
        ScrollView {
            if hasLoadedData {
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
                        Text("Genre")
                        Spacer()
                        Picker("Genre", selection: $vinyl.genre_id) {
                            ForEach(genres, id: \.id) { genre in
                                let isSelected = genre.id == vinyl.genre_id
                                Text(genre.genre_name)
                                    .tag(genre.id)
                                    .onAppear {
                                        print("Genre dans la liste: \(genre.genre_name) avec ID: \(genre.id)")
                                        print("Genre ID du vinyl: \(vinyl.genre_id)")
                                        print("Est sélectionné?: \(isSelected)")
                                    }
                            }
                        }
                        .pickerStyle(.menu)
                        .onChange(of: vinyl.genre_id) { newValue in
                            print("Nouveau genre sélectionné avec ID: \(newValue)")
                        }
                    }
                    
                    HStack {
                        Text("Genre")
                        Spacer()
                        Picker("Genre", selection: $vinyl.genre_id) {
                            ForEach(genres, id: \.id) { genre in
                                Text(genre.genre_name)
                                    .tag(genre.id)
                            }
                        }
                        .pickerStyle(.menu)
                    }
                    
                    
                    TextField("Cover Image", text: $imageURL)
                        .autocorrectionDisabled()
                        .textFieldStyle(.roundedBorder)
                    
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image
                            .resizable()
                            .frame(width: 300, height: 300)
                        
                    } placeholder: {
                        ProgressView()
                    }
                    
                    
                }
                .padding()
            }
        }
                .toolbar {
                    ToolbarItem {
                        Button {
                            Task { 
                                do {
                                    _ = try await SupabaseService.shared.upsertItem(item)
                                    _ = try await SupabaseService.shared.upsertVinyl(vinyl)
                                } catch {
                                    print(error.localizedDescription)
                                }
//                                await SupabaseService.shared.saveCollection()
                            }
                            dismiss()
                        } label: {
                            Text("Save")
                        }
                    }
                }
        .task {
            if let itemId {
                genres = await SupabaseService.shared.getAllGenres()
                artists = await SupabaseService.shared.getAllArtists()
                if let fetchedVinyl = await SupabaseService.shared.getVinyl(itemId: itemId) {
                    vinyl = fetchedVinyl
                    print("Vinyl récupéré avec genre_id: \(vinyl.genre_id)")

                }
                if let fetchedItem = await SupabaseService.shared.getItem(itemId: itemId) {
                    item = fetchedItem
                    imageURL = item.cover_image_url ?? ""
                }
                hasLoadedData = true
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
