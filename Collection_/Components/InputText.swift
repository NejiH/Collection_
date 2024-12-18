//
//  InputText.swift
//  Collectionite
//
//  Created by Arnaud HAYON on 26/11/2024.
//
import SwiftUI
struct InputText: View {
    @State var textFirstName = ""
    @State var textLastName = ""
    @FocusState var focus: FormFieldFocus?
    
    var body: some View {
        VStack {
            TextField("First Name", text: $textFirstName)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    print(textFirstName)
                    focus = .lastname
                }
                .focused($focus, equals: .firstname)
            
            TextField("Last Name", text: $textLastName)
                .textFieldStyle(.roundedBorder)
                .padding()
                .onSubmit {
                    print(textLastName)
                }
                .focused($focus, equals: .lastname)
        }
        .onAppear {
            focus = .firstname
        }
    }
    
    enum FormFieldFocus: Hashable {
        case firstname
        case lastname
    }
}
#Preview {
    InputText()
}



