//
//  AddItem.swift
//  Collection_
//
//  Created by Arnaud Hayon on 30/01/2025.
//

import SwiftUI
import Supabase

struct AddItem: View {
    @Environment(\.dismiss) var dismiss
    
    @State var name: String
    @State var description: String
    @State var cover_image_url: String
    @State var collection_id: UUID
    
    @State var barcode: Int
    @State var release_date: Date = Date()
    @State var created_at: Date
    @State var updated_at: Date?
    @State var genre_id: UUID
    @State var artist_id: UUID?
    @State var item_id: UUID = UUID()
    @State var artist_name: String = "" 
    @State var genre_name: String = ""
    
    @State var fetchCollections: [Collection] = []
    @State var fetchArtists: [Artist] = []
    @State var fetchGenres: [Genre] = []

    
    
    var body: some View {
        ScrollView {
            VStack {
                if fetchCollections.isEmpty {
                    ProgressView()
                } else {
                    VStack {
                        TextField("Title", text: $name)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Description", text: $description)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Artist", text: $artist_name)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Genre", text: $genre_name)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Cover URL", text: $cover_image_url)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        
                        DatePicker("Release Date", selection: $release_date, displayedComponents: .date)
                            .datePickerStyle(CompactDatePickerStyle()) 
                        
                        HStack {
                            
                            Text("Collection")
                            Spacer()
                            Picker("Collection", selection: $collection_id) {
                                ForEach(fetchCollections, id: \.id) { collection in
                                    Text(collection.name)
                                        .tag(collection.id)
                                }
                                
                                .pickerStyle(.menu)
                            }
                        }
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        Task {
                            do {
                                let timestampFormatter = DateFormatter()
                                timestampFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                
                                
                                fetchArtists = await SupabaseService.shared.getAllArtists()
                                fetchGenres = await SupabaseService.shared.getAllGenres()
                                
                                
                                if let existingGenre = fetchGenres.first(where: { $0.genre_name.lowercased() == genre_name.lowercased() }) {
                                    genre_id = existingGenre.id
                                } else {
                                    let newGenre = try await SupabaseService.shared.upsertGenre(Genre(
                                        id: UUID(),
                                        genre_name: genre_name,
                                        created_at: timestampFormatter.string(from: .now),
                                        updated_at: nil
                                    ))
                                    genre_id = newGenre.id
                                }
                                
                               
                                if let existingArtist = fetchArtists.first(where: { $0.artist_name.lowercased() == artist_name.lowercased() }) {
                                    artist_id = existingArtist.id
                                } else {
                                    let newArtist = try await SupabaseService.shared.upsertArtist(Artist(
                                        id: UUID(),
                                        artist_name: artist_name,
                                        created_at: timestampFormatter.string(from: .now),
                                        updated_at: nil,
                                        genre_id: genre_id
                                    ))
                                    artist_id = newArtist.id
                                }
                                
                                
                                let newItem = try await SupabaseService.shared.upsertItem(
                                    Item(
                                        id: UUID(),
                                        name: name,
                                        description: description,
                                        cover_image_url: cover_image_url,
                                        created_at: timestampFormatter.string(from: .now),
                                        updated_at: timestampFormatter.string(from: .now),
                                        collection_id: collection_id
                                    )
                                )
                                let itemID = newItem.id
                                
                                
                                
                                _ = try await SupabaseService.shared.upsertVinyl(
                                    Vinyl(
                                        id: UUID(),
                                        barcode: barcode,
                                        release_date: release_date,
                                        created_at: .now,
                                        updated_at: nil,
                                        genre_id: genre_id,
                                        artist_id: artist_id!,
                                        item_id: itemID
                                    )
                                )
                                print("All operations completed successfully")
                                dismiss()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    }) {
                        Text("Save")
                    }
                }
            }
            .task {
                do {
                    fetchCollections = try await SupabaseService.shared.getAllCollections()
                } catch {
                    print("Erreur fetch collections")
                }
            }
        }
        .padding()
    }
    
}

#Preview {
    NavigationStack {
        AddItem(name: "", description: "", cover_image_url: "", collection_id: UUID(), barcode: 123456, release_date: .now, created_at: .now, updated_at: .now, genre_id: UUID(), artist_id: UUID(), item_id: UUID())
    }
    
}
