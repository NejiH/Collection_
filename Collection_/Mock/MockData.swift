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
            Vinyls(id: 2, title: "The Black Album", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://m.media-amazon.com/images/I/41iMOb-zmgL.jpg"),
            Vinyls(id: 3, title: "good kid, m.a.a.d city", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2021/10/301fe5ed04f477febf51d79f0e1f80d1.jpeg"),
            Vinyls(id: 4, title: "DAMN.", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://images.complex.com/complex/image/upload/q_auto,c_fill,ar_1.00,w_2048,f_auto,g_auto/v1723870117/sanity-new/kendrick-new-album-cover-133402813.jpg"),
            Vinyls(id: 5, title: "Swimming", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2019/10/17670-MAC-MILLER-SWIMMING-LP-1000x1000.jpg"),
            Vinyls(id: 6, title: "Circles", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://www.thebackpackerz.com/wp-content/uploads/2020/01/mac-miller-circles-chronique.jpg"),
            Vinyls(id: 7, title: "Man on the Moon: The End of Day", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2009/03/19072-KID-CUDI-MAN-ON-THE-MOON-THE-END-OF-THE-DAY-LP.jpg"),
            Vinyls(id: 8, title: "Man on the Moon II: The Legend of Mr. Rager", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://m.media-amazon.com/images/I/81SfVgqSdOL._UF1000,1000_QL80_.jpg"),
            Vinyls(id: 9, title: "The Longest Line", release_date: Date.now, artist_id: 5, genre_id: 3, created_at: Date.now, cover_image_url: "https://assets.lastdodo.com/image/ld_medium/plain/assets/catalog/assets/6/0/5/6/pdf_056682f0-929d-012d-1061-0050569428b1.jpg"),
            Vinyls(id: 10, title: "So long and thanks for all the shoes", release_date: Date.now, artist_id: 5, genre_id: 3, created_at: Date.now, cover_image_url: "https://www.head-records.com/wp-content/uploads/2024/10/NOFX_So_Long_And_Thanks_For_All_The_Shoes.jpg")
        ]
        return vinyls.shuffled()
    }

//    static var mock1: [Vinyls] {
//        let vinyls = [
//            Vinyls(id: 1, title: "The Blueprint", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2010/07/16972-JAY-Z-THE-BLUEPRINT-LP.jpg"),
//            Vinyls(id: 2, title: "The Black Album", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://m.media-amazon.com/images/I/41iMOb-zmgL.jpg"),
//            Vinyls(id: 3, title: "good kid, m.a.a.d city", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2021/10/301fe5ed04f477febf51d79f0e1f80d1.jpeg"),
//        ]
//        return vinyls.shuffled()
//    }
//    
//    static var mock2: [Vinyls] {
//        let vinyls = [
//            Vinyls(id: 4, title: "DAMN.", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://images.complex.com/complex/image/upload/q_auto,c_fill,ar_1.00,w_2048,f_auto,g_auto/v1723870117/sanity-new/kendrick-new-album-cover-133402813.jpg"),
//            Vinyls(id: 5, title: "Swimming", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2019/10/17670-MAC-MILLER-SWIMMING-LP-1000x1000.jpg"),
//            Vinyls(id: 6, title: "Circles", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://www.thebackpackerz.com/wp-content/uploads/2020/01/mac-miller-circles-chronique.jpg"),
//            Vinyls(id: 7, title: "Man on the Moon: The End of Day", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2009/03/19072-KID-CUDI-MAN-ON-THE-MOON-THE-END-OF-THE-DAY-LP.jpg"),
//        ]
//        return vinyls.shuffled()
//    }
//    
//    static var mock3: [Vinyls] {
//        let vinyls = [
//            Vinyls(id: 8, title: "Man on the Moon II: The Legend of Mr. Rager", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://m.media-amazon.com/images/I/81SfVgqSdOL._UF1000,1000_QL80_.jpg"),
//            Vinyls(id: 9, title: "The Longest Line", release_date: Date.now, artist_id: 5, genre_id: 3, created_at: Date.now, cover_image_url: "https://assets.lastdodo.com/image/ld_medium/plain/assets/catalog/assets/6/0/5/6/pdf_056682f0-929d-012d-1061-0050569428b1.jpg"),
//            Vinyls(id: 10, title: "So long and thanks for all the shoes", release_date: Date.now, artist_id: 5, genre_id: 3, created_at: Date.now, cover_image_url: "https://www.head-records.com/wp-content/uploads/2024/10/NOFX_So_Long_And_Thanks_For_All_The_Shoes.jpg")
//        ]
//        return vinyls.shuffled()
//    }
}

extension Vinyls {
    static var mock: Vinyls = {
        Vinyls(id: 4, title: "Man on the Moon: The End of Day", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2009/03/19072-KID-CUDI-MAN-ON-THE-MOON-THE-END-OF-THE-DAY-LP.jpg")
    }()
}

extension [Artist] {
    static var mock: [Artist] {
        let artists = [
            Artist(id: 1, name: "Jay-Z", genre_id: 1),
            Artist(id: 2, name: "Kendrick Lamar", genre_id: 1),
            Artist(id: 3, name: "Mac Miller", genre_id: 1),
            Artist(id: 4, name: "Kid Cudi", genre_id: 1),
            Artist(id: 5, name: "NOFX", genre_id: 3)
        ]
        return artists
    }
}

extension [Genre] {
    static var mock: [Genre] {
        let genres = [
            Genre(id: 1, name: "Hip-Hop"),
            Genre(id: 2, name: "Rock"),
            Genre(id: 3, name: "Punk")
        ]
        return genres
    }
}

extension Date {
    func formattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        return dateFormatter.string(from: self)
    }
}

