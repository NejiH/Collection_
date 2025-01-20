//
//  Genre.swift
//  Collection_
//
//  Created by Arnaud Hayon on 09/01/2025.
//
import Foundation

struct Genre: Codable, Identifiable {
    var id: UUID
    var genre_name: String
    var created_at: String
    var updated_at: String?
    
    init(id: UUID, genre_name: String, created_at: String, updated_at: String?) {
        self.id = id
        self.genre_name = genre_name
        self.created_at = created_at
        self.updated_at = updated_at
    }
}
