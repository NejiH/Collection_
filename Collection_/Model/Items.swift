//
//  Items.swift
//  Collection_
//
//  Created by Arnaud Hayon on 14/01/2025.
//

import Foundation

struct Item: Codable, Identifiable {
    
    var id: UUID
    var name: String
    var description: String
    var cover_image_url: String?
    var created_at: String
    var updated_at: String?
    var collection_id: UUID
    
    init(id: UUID, name: String, description: String, cover_image_url: String?, created_at: String, updated_at: String?, collection_id: UUID) {
        self.id = id
        self.name = name
        self.description = description
        self.cover_image_url = cover_image_url
        self.created_at = created_at
        self.updated_at = updated_at
        self.collection_id = collection_id
    }
    
}
