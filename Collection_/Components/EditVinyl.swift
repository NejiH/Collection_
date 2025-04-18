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
    @State var hasLoadedData = false
    @Binding var updateTrigger: UUID
    
    @State var vinyl: Vinyl = Vinyl(id: UUID(), barcode: 0, release_date: .now, created_at: .now, updated_at: nil, genre_id: UUID(), artist_id: UUID(), item_id: UUID())
    @State var item: Item = Item(id: UUID(), name: "", description: "", cover_image_url: nil, created_at: "", updated_at: "", collection_id: UUID())
    
    let itemId: UUID?
    
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
                        Text("Artist")
                        Spacer()
                        Picker("Artist", selection: $vinyl.artist_id) {
                            ForEach(artists, id: \.id) { artist in
                                Text(artist.artist_name)
                                    .tag(artist.id)
                            }
                        }
                    }
                    .pickerStyle(.menu)
//
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
            
        }
        .padding()
        
        
        .toolbar {
            ToolbarItem {
                Button {
                    Task {
                        do {
                            _ = try await SupabaseService.shared.upsertItem(item)
                            _ = try await SupabaseService.shared.upsertVinyl(vinyl)
                            updateTrigger = UUID()
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    dismiss()
                } label: {
                    Text("Save")
                }
            }
        }
        .onAppear {
            Task {
               if let itemId {
                    genres = await SupabaseService.shared.getAllGenres()
                    artists = await SupabaseService.shared.getAllArtists()
                    if let fetchedVinyl = await SupabaseService.shared.getVinyl(itemId: itemId) {
                        vinyl = fetchedVinyl
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
}


#Preview {
    @Previewable @State var updateTrigger = UUID()
       
       let testItemId = UUID()
       
       return NavigationStack {
           EditVinyl(updateTrigger: .constant(updateTrigger), itemId: testItemId)
       }
}
