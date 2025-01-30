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
    @State var fetchCollections: [Collection] = []
    
    
    
    var body: some View {
        ScrollView {
            VStack {
                if fetchCollections.isEmpty {
                    ProgressView()
                } else {
                    VStack {
                        TextField("Name", text: $name)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Description", text: $description)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        
                        TextField("Cover Image", text: $cover_image_url)
                            .autocorrectionDisabled()
                            .textFieldStyle(.roundedBorder)
                        
                        HStack {
                            Text("Collection")
                            Spacer()
                            Picker("Collection", selection: $collection_id) {
                                ForEach(fetchCollections, id: \.id) { collection in
                                    Text(collection.name)
                                        .tag(collection.id)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) { 
                    Button {
                        Task {
                            do {
                                let timestampFormatter = DateFormatter()
                                timestampFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                                _ = try await SupabaseService.shared.upsertItem(
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
                                dismiss()
                            } catch {
                                print(error.localizedDescription)
                            }
                        }
                    } label: {
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
        AddItem(name: "", description: "", cover_image_url: "", collection_id: UUID() )
    }
    
}
