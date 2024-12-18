//
//  VynilDetail.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI

struct ItemsDetails: View {
    
    var vinyl: Vinyls
    
    var body: some View {
        Text("Les infos des vinyls seront affichées ici")
    }
}

#Preview {
    ItemsDetails(vinyl: .mock)
}
