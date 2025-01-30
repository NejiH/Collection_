import Foundation
import Supabase

let supabase = SupabaseClient(
    supabaseURL: URL(string: Config.supabaseURL)!,
    supabaseKey: Config.supabaseKey
)

class SupabaseService {
    static let shared = SupabaseService()
    
    private let client: SupabaseClient
    
    private init() {
        self.client = supabase
    }
    
    // Tu peux utiliser upsert a la place de insert pour creer ou mettre a jour une row de la db
    
    func upsertItem(_ item: Item) async throws -> Item {
        let created: [Item] = try await client.database
            .from("items")
            .upsert(item)
            .execute()
            .value
        
        guard let newItem = created.first else {
            throw DatabaseError.insertionFailed
        }
        
        return newItem
    }
    
    func upsertCollection(_ collection: Collection) async throws -> Collection {
        let created: [Collection] = try await client.database
            .from("collections")
            .upsert(collection)
            .execute()
            .value
        
        guard let newCollection = created.first else {
            throw DatabaseError.insertionFailed
        }
        
        return newCollection
    }
    
    func upsertVinyl(_ vinyl: Vinyl) async throws -> Vinyl {
        let created: [Vinyl] = try await client.database
            .from("vinyls")
            .upsert(vinyl)
            .execute()
            .value
        
        guard let newVinyl = created.first else {
            throw DatabaseError.insertionFailed
        }
        
        return newVinyl
    }
    
    func deleteCollection(_ collectionId: UUID) async throws -> Collection {
        let deleted: [Collection] = try await client.database
            .from("collections")
            .delete()
            .eq("id", value: collectionId)
            .select()
            .execute()
            .value

        
        guard let deleteCollection = deleted.first else {
            throw DatabaseError.deleteError
        }
        
        return deleteCollection
    }
    
    
    func deleteItem(_ itemId: UUID) async throws -> Item {
        let deleted: [Item] = try await client.database
            .from("items")
            .delete()
            .eq("id", value: itemId)
            .select()
            .execute()
            .value

        
        guard let deleteItem = deleted.first else {
            throw DatabaseError.deleteError
        }
        
        return deleteItem
    }
    
    func getAllCollections() async throws -> [Collection] {
        do {
            let collections: [Collection] = try await client.database
                .from("collections")
                .select()
                .execute()
                .value
            
            return collections
        } catch {
            print("Error fetching collections: \(error)")
            throw error // Relance l'erreur
        }
    }
    
    func getItems(collectionId: UUID) async throws -> [Item] {
        do {
            let items: [Item] = try await client.database
                .from("items")
                .select()
                .eq("collection_id", value: collectionId)
                .execute()
                .value
            
            guard items.first != nil else {
                throw DatabaseError.itemNotFound
            }
            
            return items
        } catch {
            print("Error fetching items: \(error)")
            throw error // Relance l'erreur
        }
    }

    func getItem(itemId: UUID) async -> Item? {
        do {
            let items: [Item] = try await client.database
                .from("items")
                .select()
                .eq("id", value: itemId)
                .execute()
                .value
            
            guard let item = items.first else {
                throw DatabaseError.itemNotFound
            }
            
            return item
        } catch {
            print("Error fetching items: \(error)")
//            throw error  Relance l'erreur
        }
        return nil
    }

    func getVinyl(itemId: UUID) async -> Vinyl? {
        do {
            let vinyls: [Vinyl] = try await client.database
                .from("vinyls")
                .select()
                .eq("item_id", value: itemId)
                .execute()
                .value
            
            guard let vinyl = vinyls.first else {
                throw DatabaseError.vinylNotFound
            }
            
            return vinyl
        } catch {
            print("Error fetching vinyl: \(error)")
           // throw error // Relance l'erreur
        }
        return nil
    }
    
    func getAllVinyls() async throws -> [Vinyl] {
        do {
            let vinyls: [Vinyl] = try await client.database
                .from("vinyls")
                .select()
                .execute()
                .value
            
            return vinyls
        } catch {
            print("Error fetching vinyl: \(error)")
            throw error // Relance l'erreur
        }
    }
    
//    func getAllArtists() async throws -> [Artist] {
//        do {
//            let artists: [Artist] = try await client.database
//                .from("artists")
//                .select()
//                .execute()
//                .value
//            
//            return artists
//        } catch {
//            print("Error fetching artists: \(error)")
//            throw error // Relance l'erreur
//        }
//    }
    
    func getAllArtists() async -> [Artist] {
        do {
            let artists: [Artist] = try await client.database
                .from("artists")
                .select()
                .execute()
                .value
            
            return artists
        } catch {
            print("Error fetching vinyl: \(error)")
//            throw error  Relance l'erreur
        }
        return []
    }
    
    func getAllVinylsByArtist(artistId: UUID) async throws -> [Vinyl] {
        do {
            let vinylsByArtist: [Vinyl] = try await client.database
                .from("vinyls")
                .select()
                .eq("artist_id", value: artistId)
                .execute()
                .value
            
            return vinylsByArtist
        } catch {
            print("Error fetching vinyls: \(error)")
            throw DatabaseError.vinylNotFound
        }
    }
    
    func getAllVinylsByGenre(genreId: UUID) async throws -> [Vinyl] {
        do {
            let vinylsByGenre: [Vinyl] = try await client.database
                .from("vinyls")
                .select()
                .eq("genre_id", value: genreId)
                .execute()
                .value
            
            return vinylsByGenre
        } catch {
            print("Error fetching vinyls: \(error)")
            throw DatabaseError.vinylNotFound
        }
    }
    
    func getArtist(artistId: UUID) async throws -> Artist {
        do {
            let artist: [Artist] = try await client.database
                .from("artists")
                .select()
                .eq("id", value: artistId)
                .execute()
                .value
            
            guard let artist = artist.first else {
                throw DatabaseError.standardError
            }
            
            return artist
        } catch {
            print("Error fetching artist: \(error)")
            throw error // Relance l'erreur
        }
    }
    
    func getGenre(genreId: UUID) async throws -> Genre {
        do {
            let genre: [Genre] = try await client.database
                .from("genres")
                .select()
                .eq("id", value: genreId)
                .execute()
                .value
            
            guard let genre = genre.first else {
                throw DatabaseError.standardError
            }
            
            return genre
        } catch {
            print("Error fetching genre: \(error)")
            throw error // Relance l'erreur
        }
    }
    
   

    func getAllGenres() async -> [Genre] {
        do {
            let genres: [Genre] = try await client.database
                .from("genres")
                .select()
                .execute()
                .value
            
            return genres
        } catch {
            print("Error fetching vinyl: \(error)")
//            throw error // Relance l'erreur
        }
        return []
    }

    // Déplacer DatabaseError ici, au niveau de la classe, pour qu'il soit accessible partout
    enum DatabaseError: Error {
        case vinylNotFound
        case insertionFailed
        case itemNotFound
        case standardError
        case deleteError
        case collectionCreationFailed
        
        var errorText: String {
            switch self {
            case .vinylNotFound:
                return "Il n'y a pas de vinyl dans la base de données"
            case .insertionFailed:
                return "L'insertion de l'item a échouée."
            case .itemNotFound:
                return "L'item n'a pas été trouvé"
            case .standardError:
                return "Une erreur est survenue"
            case .deleteError:
                return "Erreur de suppression"
            case .collectionCreationFailed:
                return "La création de la collection a échouée"
            }
        }
    }
}
