//
//  Vinyls.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//

import Foundation

struct Vinyls: Decodable, Identifiable {
    let id: Int
    let title: String
    let release_date: Date
    let artist_id: Int
    let genre_id: Int
    let created_at: Date
    let cover_image_url: String

    init(id: Int, title: String, release_date: Date, artist_id: Int, genre_id: Int, created_at: Date, cover_image_url: String) {
        self.id = id
        self.title = title
        self.release_date = release_date
        self.artist_id = artist_id
        self.genre_id = genre_id
        self.created_at = created_at
        self.cover_image_url = cover_image_url
    }
}

struct Genre: Identifiable, Hashable {
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

struct Artist: Identifiable {
    let id: Int
    let name: String
    let genre_id: Int
    
    init(id: Int, name: String, genre_id: Int) {
        self.id = id
        self.name = name
        self.genre_id = genre_id
    }
}

struct VinylsArtists {
    let vinyl_id: Int
    let artist_id: Int
    
    init(vinyl_id: Int, artist_id: Int) {
        self.vinyl_id = vinyl_id
        self.artist_id = artist_id
    }
}
