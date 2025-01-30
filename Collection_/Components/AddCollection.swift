//
//  AddCollection.swift
//  Collection_
//
//  Created by Arnaud Hayon on 06/01/2025.
//

import SwiftUI

struct AddCollection: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var name: String = ""
    
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                TextField("Name", text: $name)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                
                Spacer()
            }
            .frame(minHeight: UIScreen.main.bounds.height - 220) // Donne une hauteur minimale
            
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    Task {
                        do {
                            let timestampFormatter = DateFormatter()
                            timestampFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                            _ = try await SupabaseService.shared
                                .upsertCollection(
                                    Collection(
                                        id: UUID(),
                                        name: name,
                                        created_at: timestampFormatter.string(from: .now),
                                        updated_at: timestampFormatter.string(from: .now)
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
        .padding()
        .navigationTitle("Ajouter une collection")
        
        
    }
}

#Preview {
    NavigationStack {
        AddCollection()
    }
}
