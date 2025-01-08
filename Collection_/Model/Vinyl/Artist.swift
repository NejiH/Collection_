//
//  Artist.swift
//  Collection_
//
//  Created by Arnaud Hayon on 09/01/2025.
//
import Foundation

struct Artist: Codable, Identifiable {
    let id: Int
    let name: String
    let genre_id: Int
    
    init(id: Int, name: String, genre_id: Int) {
        self.id = id
        self.name = name
        self.genre_id = genre_id
    }
}
