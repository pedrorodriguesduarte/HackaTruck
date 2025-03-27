import Foundation

struct Times: Decodable, Hashable {
    let nome: String?
    let dataFundacao: String?
    let torcidaOrganizada: String?
    let emblemaUrl: String?

    
    var id: String {
        nome ?? UUID().uuidString
    }

   
    init(nome: String?, dataFundacao: String?, torcidaOrganizada: String?, emblemaUrl: String?) {
        self.nome = nome
        self.dataFundacao = dataFundacao
        self.torcidaOrganizada = torcidaOrganizada
        self.emblemaUrl = emblemaUrl
    }

   
    enum CodingKeys: String, CodingKey {
        case nome
        case dataFundacao
        case torcidaOrganizada
        case emblemaUrl
    }
}


