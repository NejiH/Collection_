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
    var release_date: String
    var created_at: String
    var updated_at: String?
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
    
    
    init(id: UUID, barcode: Int, release_date: String, created_at: String, updated_at: String?, genre_id: UUID, artist_id: UUID, item_id: UUID) {
        self.id = id
        self.barcode = barcode
        self.release_date = release_date
        self.created_at = created_at
        self.updated_at = updated_at
        self.genre_id = genre_id
        self.artist_id = artist_id
        self.item_id = item_id
    }
}
