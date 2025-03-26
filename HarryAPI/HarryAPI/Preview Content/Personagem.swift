import Foundation

struct Personagem: Codable, Identifiable {
    let id = UUID()
    let name: String?
    let house: String?
    let actor: String?
    let image: String?
    let yearOfBirth: Int?
    let dateOfBirth: String?
    let wizard: Bool? 
    
    enum CodingKeys: String, CodingKey {
        case name
        case house
        case actor
        case image
        case yearOfBirth
        case dateOfBirth
        case wizard
    }
}

