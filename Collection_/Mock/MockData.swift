//
//  MockData.swift
//  Collection_
//
//  Created by Arnaud Hayon on 17/12/2024.
//

import Foundation

extension [Vinyls] {
    static var mock: [Vinyls] {
        let vinyls = [
            Vinyls(id: 1, title: "The Blueprint", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2010/07/16972-JAY-Z-THE-BLUEPRINT-LP.jpg"),
            Vinyls(id: 2, title: "good kid, m.a.a.d city", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2021/10/301fe5ed04f477febf51d79f0e1f80d1.jpeg"),
            Vinyls(id: 3, title: "Swimming", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2019/10/17670-MAC-MILLER-SWIMMING-LP-1000x1000.jpg"),
            Vinyls(id: 4, title: "Man on the Moon: The End of Day", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2009/03/19072-KID-CUDI-MAN-ON-THE-MOON-THE-END-OF-THE-DAY-LP.jpg")
        ]
        return vinyls.shuffled()
    }
}

extension Vinyls {
    static var mock: Vinyls = {
        Vinyls(id: 1, title: "The Blueprint", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2010/07/16972-JAY-Z-THE-BLUEPRINT-LP.jpg")
    }()
}


