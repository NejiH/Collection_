//
//  Boardgame.swift
//  Collection_
//
//  Created by Arnaud Hayon on 13/01/2025.
//

import Foundation

struct Boardgame: Codable, Identifiable {
    var id: UUID
    var barcode: Int
    var subtitle: String
    var editor: String
    var age: Int
    var nb_players: Int
    var duration: Int
    var created_at: Date
    var updated_at: Date?
    var item_id: UUID
    
    init(id: UUID, barcode: Int, subtitle: String, editor: String, age: Int, nb_players: Int, duration: Int, created_at: Date, updated_at: Date?, item_id: UUID) {
        self.id = id
        self.barcode = barcode
        self.subtitle = subtitle
        self.editor = editor
        self.age = age
        self.nb_players = nb_players
        self.duration = duration
        self.created_at = created_at
        self.updated_at = updated_at
        self.item_id = item_id
    }
}
