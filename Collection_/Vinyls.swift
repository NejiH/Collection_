//
//  Vinyls.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//

import Foundation

struct Vinyls: Codable, Identifiable {
    let id: Int
    var title: String
    var release_date: Date
    var artist_id: Int
    var genre_id: Int
    var created_at: Date
    var cover_image_url: String
    
    init(id: Int){
        self.id = id
        self.title = ""
        self.release_date = Date.now
        self.artist_id = 1
        self.genre_id = 1
        self.created_at = Date.now
        self.cover_image_url = "https://i.discogs.com/oHZNURChd9_A7sbgVwSTI674FryWSMh5kQrjkZoYMyE/rs:fit/g:sm/q:90/h:597/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTMyNTE1/MzAyLTE3MzQxOTk4/OTAtOTMyNS5qcGVn.jpeg"
    }

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

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

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

struct VinylsArtists {
    let vinyl_id: Int
    let artist_id: Int
    
    init(vinyl_id: Int, artist_id: Int) {
        self.vinyl_id = vinyl_id
        self.artist_id = artist_id
    }
}
