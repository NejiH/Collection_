//
//  Artist.swift
//  Collection_
//
//  Created by Arnaud Hayon on 09/01/2025.
//
import Foundation

struct Artist: Codable, Identifiable {
    var id: UUID
    var artist_name: String
    var created_at: Date
    var updated_at: Date?
    var genre_id: UUID
    
    init(id: UUID, artist_name: String, created_at: Date, updated_at: Date?, genre_id: UUID) {
        self.id = id
        self.artist_name = artist_name
        self.created_at = created_at
        self.updated_at = updated_at
        self.genre_id = genre_id
    }
}
