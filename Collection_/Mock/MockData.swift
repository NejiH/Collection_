////
////  MockData.swift
////  Collection_
////
////  Created by Arnaud Hayon on 17/12/2024.
////
//
//import Foundation
//
//extension [Vinyl] {
//    static var mock: [Vinyl] {
//        let vinyls = [
//            Vinyl(id: 1, title: "The Blueprint", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2010/07/16972-JAY-Z-THE-BLUEPRINT-LP.jpg"),
//            Vinyl(id: 2, title: "The Black Album", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://m.media-amazon.com/images/I/41iMOb-zmgL.jpg"),
//            Vinyl(id: 3, title: "good kid, m.a.a.d city", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2021/10/301fe5ed04f477febf51d79f0e1f80d1.jpeg"),
//            Vinyl(id: 4, title: "DAMN.", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://images.complex.com/complex/image/upload/q_auto,c_fill,ar_1.00,w_2048,f_auto,g_auto/v1723870117/sanity-new/kendrick-new-album-cover-133402813.jpg"),
//            Vinyl(id: 5, title: "Swimming", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2019/10/17670-MAC-MILLER-SWIMMING-LP-1000x1000.jpg"),
//            Vinyl(id: 6, title: "Circles", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://www.thebackpackerz.com/wp-content/uploads/2020/01/mac-miller-circles-chronique.jpg"),
//            Vinyl(id: 7, title: "Man on the Moon: The End of Day", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2009/03/19072-KID-CUDI-MAN-ON-THE-MOON-THE-END-OF-THE-DAY-LP.jpg"),
//            Vinyl(id: 8, title: "Man on the Moon II: The Legend of Mr. Rager", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://m.media-amazon.com/images/I/81SfVgqSdOL._UF1000,1000_QL80_.jpg"),
//            Vinyl(id: 9, title: "The Longest Line", release_date: Date.now, artist_id: 5, genre_id: 3, created_at: Date.now, cover_image_url: "https://assets.lastdodo.com/image/ld_medium/plain/assets/catalog/assets/6/0/5/6/pdf_056682f0-929d-012d-1061-0050569428b1.jpg"),
//            Vinyl(id: 10, title: "So long and thanks for all the shoes", release_date: Date.now, artist_id: 5, genre_id: 3, created_at: Date.now, cover_image_url: "https://www.head-records.com/wp-content/uploads/2024/10/NOFX_So_Long_And_Thanks_For_All_The_Shoes.jpg")
//        ]
//        return vinyls.shuffled()
//    }
//
////    static var mock1: [Vinyl] {
////        let vinyls = [
////            Vinyl(id: 1, title: "The Blueprint", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2010/07/16972-JAY-Z-THE-BLUEPRINT-LP.jpg"),
////            Vinyl(id: 2, title: "The Black Album", release_date: Date.now, artist_id: 1, genre_id: 1, created_at: Date.now, cover_image_url: "https://m.media-amazon.com/images/I/41iMOb-zmgL.jpg"),
////            Vinyl(id: 3, title: "good kid, m.a.a.d city", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2021/10/301fe5ed04f477febf51d79f0e1f80d1.jpeg"),
////        ]
////        return vinyls.shuffled()
////    }
////    
////    static var mock2: [Vinyl] {
////        let vinyls = [
////            Vinyl(id: 4, title: "DAMN.", release_date: Date.now, artist_id: 2, genre_id: 1, created_at: Date.now, cover_image_url: "https://images.complex.com/complex/image/upload/q_auto,c_fill,ar_1.00,w_2048,f_auto,g_auto/v1723870117/sanity-new/kendrick-new-album-cover-133402813.jpg"),
////            Vinyl(id: 5, title: "Swimming", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2019/10/17670-MAC-MILLER-SWIMMING-LP-1000x1000.jpg"),
////            Vinyl(id: 6, title: "Circles", release_date: Date.now, artist_id: 3, genre_id: 1, created_at: Date.now, cover_image_url: "https://www.thebackpackerz.com/wp-content/uploads/2020/01/mac-miller-circles-chronique.jpg"),
////            Vinyl(id: 7, title: "Man on the Moon: The End of Day", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2009/03/19072-KID-CUDI-MAN-ON-THE-MOON-THE-END-OF-THE-DAY-LP.jpg"),
////        ]
////        return vinyls.shuffled()
////    }
////    
////    static var mock3: [Vinyl] {
////        let vinyls = [
////            Vinyl(id: 8, title: "Man on the Moon II: The Legend of Mr. Rager", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://m.media-amazon.com/images/I/81SfVgqSdOL._UF1000,1000_QL80_.jpg"),
////            Vinyl(id: 9, title: "The Longest Line", release_date: Date.now, artist_id: 5, genre_id: 3, created_at: Date.now, cover_image_url: "https://assets.lastdodo.com/image/ld_medium/plain/assets/catalog/assets/6/0/5/6/pdf_056682f0-929d-012d-1061-0050569428b1.jpg"),
////            Vinyl(id: 10, title: "So long and thanks for all the shoes", release_date: Date.now, artist_id: 5, genre_id: 3, created_at: Date.now, cover_image_url: "https://www.head-records.com/wp-content/uploads/2024/10/NOFX_So_Long_And_Thanks_For_All_The_Shoes.jpg")
////        ]
////        return vinyls.shuffled()
////    }
//}
//
//extension Vinyl {
//    static var mock: Vinyl = {
//        Vinyl(id: 4, title: "Man on the Moon: The End of Day", release_date: Date.now, artist_id: 4, genre_id: 1, created_at: Date.now, cover_image_url: "https://groundzero.fr/wp-content/uploads/2009/03/19072-KID-CUDI-MAN-ON-THE-MOON-THE-END-OF-THE-DAY-LP.jpg")
//    }()
//}
//
//extension [Artist] {
//    static var mock: [Artist] {
//        let artists = [
//            Artist(id: 1, name: "Jay-Z", genre_id: 1),
//            Artist(id: 2, name: "Kendrick Lamar", genre_id: 1),
//            Artist(id: 3, name: "Mac Miller", genre_id: 1),
//            Artist(id: 4, name: "Kid Cudi", genre_id: 1),
//            Artist(id: 5, name: "NOFX", genre_id: 3)
//        ]
//        return artists
//    }
//}
//
//extension [Genre] {
//    static var mock: [Genre] {
//        let genres = [
//            Genre(id: 1, name: "Hip-Hop"),
//            Genre(id: 2, name: "Rock"),
//            Genre(id: 3, name: "Punk")
//        ]
//        return genres
//    }
//}
//
//extension Date {
//    func formattedDate() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .short
//        dateFormatter.timeStyle = .none
//        return dateFormatter.string(from: self)
//    }
//}
//

import Foundation

// MARK: - Date Helpers
extension Date {
    static func fromString(_ dateString: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.date(from: dateString)
    }
    
    var timestamp: TimeInterval {
        return self.timeIntervalSince1970
    }
    
    var stringValue: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter.string(from: self)
    }
}

// MARK: - Mock Items
extension Array where Element == Item {
    static var mock: [Item] {
        [
            Item(
                id: UUID(uuidString: "AA1B2C3D-4E5F-6G7H-8I9J-0K1L2M3N4O5P")!,
                name: "The Blueprint",
                description: "Sixième album studio de Jay-Z",
                cover_image_url: "https://example.com/blueprint.jpg",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: Date.fromString("14-01-2024")!,
                collection_id: UUID()
            ),
            Item(
                id: UUID(uuidString: "BB2C3D4E-5F6G-7H8I-9J0K-1L2M3N4O5P6Q")!,
                name: "To Pimp a Butterfly",
                description: "Troisième album studio de Kendrick Lamar",
                cover_image_url: "https://example.com/tpab.jpg",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: Date.fromString("14-01-2024")!,
                collection_id: UUID()
            ),
            Item(
                id: UUID(uuidString: "CC3D4E5F-6G7H-8I9J-0K1L-2M3N4O5P6Q7R")!,
                name: "Swimming",
                description: "Cinquième album studio de Mac Miller",
                cover_image_url: "https://example.com/swimming.jpg",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: Date.fromString("14-01-2024")!,
                collection_id: UUID()
            ),
            Item(
                id: UUID(uuidString: "DD4E5F6G-7H8I-9J0K-1L2M-3N4O5P6Q7R8S")!,
                name: "Punk in Drublic",
                description: "Cinquième album studio de NOFX",
                cover_image_url: "https://example.com/punk-in-drublic.jpg",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: Date.fromString("14-01-2024")!,
                collection_id: UUID()
            ),
            Item(
                id: UUID(uuidString: "EE5F6G7H-8I9J-0K1L-2M3N-4O5P6Q7R8S9T")!,
                name: "Enema of the State",
                description: "Troisième album studio de Blink-182",
                cover_image_url: "https://example.com/enema-of-the-state.jpg",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: Date.fromString("14-01-2024")!,
                collection_id: UUID()
            )
        ]
    }
}

// MARK: - Mock Genres
extension Array where Element == Genre {
    static var mock: [Genre] {
        [
            Genre(
                id: UUID(uuidString: "1A4F3C2B-8D7E-4F6A-9B2C-5E3D8A7C1F4E")!,
                genre_name: "Hip-hop",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil
            ),
            Genre(
                id: UUID(uuidString: "2B5G4D3C-9E8F-5G7B-0C3D-6F4E9B8D2G5F")!,
                genre_name: "Rock",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil
            ),
            Genre(
                id: UUID(uuidString: "3C6H5E4D-0F9G-6H8C-1D4E-7G5F0C9E3H6G")!,
                genre_name: "Punk Rock",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil
            )
        ]
    }
}

// MARK: - Mock Artists
extension Array where Element == Artist {
    static var mock: [Artist] {
        [
            Artist(
                id: UUID(uuidString: "4D7I6F5E-1G0H-7I9D-2E5F-8H6G1D0F4I7H")!,
                artist_name: "Jay-Z",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "1A4F3C2B-8D7E-4F6A-9B2C-5E3D8A7C1F4E")!
            ),
            Artist(
                id: UUID(uuidString: "5E8J7G6F-2H1I-8J0E-3F6G-9I7H2E1G5J8I")!,
                artist_name: "Kendrick Lamar",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "1A4F3C2B-8D7E-4F6A-9B2C-5E3D8A7C1F4E")!
            ),
            Artist(
                id: UUID(uuidString: "6F9K8H7G-3I2J-9K1F-4G7H-0J8I3F2H6K9J")!,
                artist_name: "Mac Miller",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "1A4F3C2B-8D7E-4F6A-9B2C-5E3D8A7C1F4E")!
            ),
            Artist(
                id: UUID(uuidString: "7G0L9I8H-4J3K-0L2G-5H8I-1K9J4G3I7L0K")!,
                artist_name: "NOFX",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "3C6H5E4D-0F9G-6H8C-1D4E-7G5F0C9E3H6G")!
            ),
            Artist(
                id: UUID(uuidString: "8H1M0J9I-5K4L-1M3H-6I9J-2L0K5H4J8M1L")!,
                artist_name: "Blink 182",
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "3C6H5E4D-0F9G-6H8C-1D4E-7G5F0C9E3H6G")!
            )
        ]
    }
}

// MARK: - Mock Vinyls
extension Array where Element == Vinyl {
    static var mock: [Vinyl] {
        [
            Vinyl(
                id: UUID(uuidString: "9I2N1K0J-6L5M-2N4I-7J0K-3M1L6I5K9N2M")!,
                barcode: 123456789,
                cover_image_url: "https://example.com/blueprint.jpg",
                release_date: Date.fromString("11-09-2001")!,
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "1A4F3C2B-8D7E-4F6A-9B2C-5E3D8A7C1F4E")!,
                artist_id: UUID(uuidString: "4D7I6F5E-1G0H-7I9D-2E5F-8H6G1D0F4I7H")!,
                item_id: UUID(uuidString: "AA1B2C3D-4E5F-6G7H-8I9J-0K1L2M3N4O5P")!
            ),
            Vinyl(
                id: UUID(uuidString: "0J3O2L1K-7M6N-3O5J-8K1L-4N2M7J6L0O3N")!,
                barcode: 987654321,
                cover_image_url: "https://example.com/tpab.jpg",
                release_date: Date.fromString("15-03-2015")!,
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "1A4F3C2B-8D7E-4F6A-9B2C-5E3D8A7C1F4E")!,
                artist_id: UUID(uuidString: "5E8J7G6F-2H1I-8J0E-3F6G-9I7H2E1G5J8I")!,
                item_id: UUID(uuidString: "BB2C3D4E-5F6G-7H8I-9J0K-1L2M3N4O5P6Q")!
            ),
            Vinyl(
                id: UUID(uuidString: "1K4P3M2L-8N7O-4P6K-9L2M-5O3N8K7M1P4O")!,
                barcode: 456789123,
                cover_image_url: "https://example.com/swimming.jpg",
                release_date: Date.fromString("03-08-2018")!,
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "1A4F3C2B-8D7E-4F6A-9B2C-5E3D8A7C1F4E")!,
                artist_id: UUID(uuidString: "6F9K8H7G-3I2J-9K1F-4G7H-0J8I3F2H6K9J")!,
                item_id: UUID(uuidString: "CC3D4E5F-6G7H-8I9J-0K1L-2M3N4O5P6Q7R")!
            ),
            Vinyl(
                id: UUID(uuidString: "2L5Q4N3M-9O8P-5Q7L-0M3N-6P4O9L8N2Q5P")!,
                barcode: 789123456,
                cover_image_url: "https://example.com/punk-in-drublic.jpg",
                release_date: Date.fromString("19-07-1994")!,
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "3C6H5E4D-0F9G-6H8C-1D4E-7G5F0C9E3H6G")!,
                artist_id: UUID(uuidString: "7G0L9I8H-4J3K-0L2G-5H8I-1K9J4G3I7L0K")!,
                item_id: UUID(uuidString: "DD4E5F6G-7H8I-9J0K-1L2M-3N4O5P6Q7R8S")!
            ),
            Vinyl(
                id: UUID(uuidString: "3M6R5O4N-0P9Q-6R8M-1N4O-7Q5P0M9O3R6Q")!,
                barcode: 321654987,
                cover_image_url: "https://example.com/enema-of-the-state.jpg",
                release_date: Date.fromString("01-06-1999")!,
                created_at: Date.fromString("14-01-2024")!,
                updated_at: nil,
                genre_id: UUID(uuidString: "3C6H5E4D-0F9G-6H8C-1D4E-7G5F0C9E3H6G")!,
                artist_id: UUID(uuidString: "8H1M0J9I-5K4L-1M3H-6I9J-2L0K5H4J8M1L")!,
                item_id: UUID(uuidString: "EE5F6G7H-8I9J-0K1L-2M3N-4O5P6Q7R8S9T")!
            )
        ]
    }
}
