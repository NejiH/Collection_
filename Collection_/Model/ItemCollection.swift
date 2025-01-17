//
//  VinylsList.swift
//  Collection_
//
//  Created by Arnaud Hayon on 18/12/2024.
//

import SwiftUI

// To delete in the future

struct ItemCollection: Identifiable {
    var id: Int
    var vinyls: [Vinyl]
    var vinylsData: [Vinyl.ID: Vinyl] {
        didSet {
            vinyls = Array(vinylsData.values)
        }
    }
    let name: String
    let color: Color
    
    init(id: Int, vinyls: [Vinyl], name: String, color: Color) {
        self.id = id
        self.vinylsData = Dictionary(flatGrouping: vinyls, by: \.id)
        self.vinyls = vinyls
        self.name = name
        self.color = color
    }
}

extension Dictionary where Key: Hashable {
    init<S>(flatGrouping values: S, by keyForValue: (S.Element) throws -> Key) rethrows
    where Value == S.Element, S: Sequence {
        self = try values.reduce(into: [:]) { result, element in
            let key = try keyForValue(element)
            result[key] = element // Directly assign the value
        }
    }
}
