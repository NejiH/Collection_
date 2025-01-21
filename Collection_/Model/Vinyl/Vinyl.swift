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
    
    
    init(id: UUID, barcode: Int, release_date: Date, created_at: Date, updated_at: Date?, genre_id: UUID, artist_id: UUID, item_id: UUID) {
        self.id = id
        self.barcode = barcode
        self.release_date = release_date
        self.created_at = created_at
        self.updated_at = updated_at
        self.genre_id = genre_id
        self.artist_id = artist_id
        self.item_id = item_id
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(UUID.self, forKey: .id)
        self.barcode = try container.decode(Int.self, forKey: .barcode)
        
        if let releaseDate = try? container.decodeIfPresent(Date.self, forKey: .release_date) {
            self.release_date = releaseDate
        } else if let releaseDate = try? container.decodeIfPresent(String.self, forKey: .release_date) {
            let dateFormater = DateFormatter()
            dateFormater.dateFormat = "yyyy-MM-dd"
            self.release_date = dateFormater.date(from: releaseDate) ?? Date.now
        } else {
            self.release_date = Date.now
        }
        
        if let createdAt = try? container.decodeIfPresent(Date.self, forKey: .created_at) {
            self.created_at = createdAt
        } else if let createdAt = try? container.decodeIfPresent(String.self, forKey: .created_at) {
            let timestampFormater = DateFormatter()
            timestampFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
            self.created_at = timestampFormater.date(from: createdAt) ?? Date.now
        } else {
            self.created_at = Date.now
        }

        self.updated_at = try container.decodeIfPresent(Date.self, forKey: .updated_at)
        self.genre_id = try container.decode(UUID.self, forKey: .genre_id)
        self.artist_id = try container.decode(UUID.self, forKey: .artist_id)
        self.item_id = try container.decode(UUID.self, forKey: .item_id)
    }
    
    enum CodingKeys: CodingKey {
        case id
        case barcode
        case release_date
        case created_at
        case updated_at
        case genre_id
        case artist_id
        case item_id
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.id, forKey: .id)
        try container.encode(self.barcode, forKey: .barcode)

        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "yyyy-MM-dd"
        try container.encode(dateFormater.string(from: self.release_date), forKey: .release_date)

        let timestampFormater = DateFormatter()
        timestampFormater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        try container.encode(timestampFormater.string(from: self.created_at), forKey: .created_at)

        try container.encodeIfPresent(self.updated_at, forKey: .updated_at)
        try container.encode(self.genre_id, forKey: .genre_id)
        try container.encode(self.artist_id, forKey: .artist_id)
        try container.encode(self.item_id, forKey: .item_id)
    }
    
}
