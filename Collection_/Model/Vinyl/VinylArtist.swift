//
//  VinylArtist.swift
//  Collection_
//
//  Created by Arnaud Hayon on 09/01/2025.
//
import Foundation

struct VinylArtist {
    let vinyl_id: UUID
    let artist_id: UUID
    
    init(vinyl_id: UUID, artist_id: UUID) {
        self.vinyl_id = vinyl_id
        self.artist_id = artist_id
    }
}
