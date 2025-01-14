//
//  Vinyl.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//
import Foundation

struct Vinyl: Codable, Identifiable {
    var id: UUID
    var barcode: Int
    var cover_image_url: String
    var release_date: Date
    var created_at: Date
    var updated_at: Date?
    var genre_id: UUID
    var artist_id: UUID
    var item_id: UUID
    
    //    init(id: Int = -1){
    //        self.id = UUID()
    //        self.barcode = 0
    //        self.cover_image_url = "https://i.discogs.com/oHZNURChd9_A7sbgVwSTI674FryWSMh5kQrjkZoYMyE/rs:fit/g:sm/q:90/h:597/w:600/czM6Ly9kaXNjb2dz/LWRhdGFiYXNlLWlt/YWdlcy9SLTMyNTE1/MzAyLTE3MzQxOTk4/OTAtOTMyNS5qcGVn.jpeg"
    //        self.release_date = Date.now
    //        self.created_at = Date.now
    //        self.genre_id = UUID()
    //        self.artist_id = UUID()
    //        self.item_id = UUID()
    
    
    init(id: UUID, barcode: Int, cover_image_url: String, release_date: Date, created_at: Date, updated_at: Date?, genre_id: UUID, artist_id: UUID, item_id: UUID) {
        self.id = id
        self.barcode = barcode
        self.cover_image_url = cover_image_url
        self.release_date = release_date
        self.created_at = created_at
        self.updated_at = updated_at
        self.genre_id = genre_id
        self.artist_id = artist_id
        self.item_id = item_id
    }
}
