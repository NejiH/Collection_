//
//  VinylsList.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI

struct VinylCollection: Identifiable {
    let id: Int
    var vinyls: [Vinyls]
    let name: String
    let color: Color
}
