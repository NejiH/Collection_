//
//  CollectionList.swift
//  Collection_
//
//  Created by Arnaud Hayon on 16/12/2024.
//

import SwiftUI

struct CollectionList: View {
    
    @State private var isEditing: Bool = false
    @State var collections: [Collection]
    

    
    @Environment(\.dismiss) var dismiss
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(collections, id: \.id) { collection in
                    VStack {
                        CollectionDetail(collection: collection)
                        
                        if isEditing {
                            Button {
                                Task {
                                    do {
                                        let deletedCollection = try await SupabaseService.shared.deleteCollection(collection.id)
                                        collections.removeAll { $0.id == deletedCollection.id }
                                    } catch {
                                        print(error.localizedDescription)
                                    }
                                }
                            } label: {
                                Text("Delete")
                            }
                        }
                    }
                }
                
                NavigationLink (destination: AddCollection()) {
                    HStack {
                        VStack {
                            Image(systemName: "plus.app")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .cornerRadius(10)
                            
                            Text("Nouvelle collection")
                                .font(.headline)
                                .foregroundStyle(.gray)
                                .lineLimit(1)
                        }
                    }
                }
                
            }
            .padding()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(isEditing ? "Terminer" : "Éditer") {
                    isEditing.toggle() 
                }
            }
        }
    }
    
}


#Preview {
    CollectionList(collections: [])
}
