//
//  CollectionDetail.swift
//  Collection_
//
//  Created by Arnaud Hayon on 09/01/2025.
//

import Foundation

struct Collections: Codable, Identifiable {
    var id: Int
    var name: String
    var created_at: Date
    var updated_at: Date?
    
    init(id: Int, name: String, created_at: Date, updated_at: Date?) {
        self.id = id
        self.name = name
        self.created_at = created_at
        self.updated_at = updated_at
    }
}
