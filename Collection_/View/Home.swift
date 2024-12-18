//
//  Home.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//


import SwiftUI
struct Home: View {
    var body: some View {
        ScrollView {
            StyledGenericButton(type: .text(value: "Homescreen - empty"))
            StyledGenericButton(type: .text(value: "Homescreen - not empty"))
            StyledGenericButton(type: .text(value: "Add a collection"))
            StyledGenericButton(type: .text(value: "Collection content"))
            StyledGenericButton(type: .text(value: "Add an item to a collection"))
            StyledGenericButton(type: .text(value: "Item details"))
        }
    }
}
#Preview {
    Home()
}








