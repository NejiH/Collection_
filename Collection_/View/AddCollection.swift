//
//  AddCollection.swift
//  Collection_
//
//  Created by Arnaud Hayon on 06/01/2025.
//

import SwiftUI

struct AddCollection: View {
    
    @State var collectionName: String = ""
    @State var collectionType: String = ""
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                TextField("Title", text: $collectionName)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                
                TextField("Type", text: $collectionType)
                    .autocorrectionDisabled()
                    .textFieldStyle(.roundedBorder)
                Spacer()
                
                StyledGenericButton(type: .text(value: "Ajouter une collection"))
            }
            .frame(minHeight: UIScreen.main.bounds.height - 220) // Donne une hauteur minimale

        }
        .padding()
        .navigationTitle("Ajouter une collection")

        
    }
}

#Preview {
    AddCollection()
}
