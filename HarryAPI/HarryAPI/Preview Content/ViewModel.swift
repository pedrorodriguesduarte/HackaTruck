import Foundation

class ViewModel: ObservableObject {
    @Published var chars: [Personagem] = []
    
    init() {
        fetchData()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://hp-api.onrender.com/api/characters/house/gryffindor") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                
                if let decoded = try? JSONDecoder().decode([Personagem].self, from: data) {
                    print(decoded) 
                    DispatchQueue.main.async {
                        self.chars = decoded
                    }
                } else {
                    print("Erro ao decodificar os dados ou dados vazios")
                }
            } else {
                print("Erro ao carregar os dados: \(error?.localizedDescription ?? "Desconhecido")")
            }
        }.resume()
    }
}

