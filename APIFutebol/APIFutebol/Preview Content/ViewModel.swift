import Foundation

class ViewModel: ObservableObject {
    
    @Published var time: [Times] = []
    @Published var isLoading = false
    
    func fetch() {
        guard let url = URL(string: "http://127.0.0.1:1880/duarteget") else {
            print("URL inválida")
            return
        }
        
        isLoading = true
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            
            if let error = error {
                DispatchQueue.main.async {
                    print("Erro na requisição: \(error.localizedDescription)")
                    self?.isLoading = false
                }
                return
            }
            
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                DispatchQueue.main.async {
                    print("Erro: Status code \(response.statusCode)")
                    self?.isLoading = false
                }
                return
            }
            
            
            guard let data = data else {
                DispatchQueue.main.async {
                    print("Dados nulos recebidos")
                    self?.isLoading = false
                }
                return
            }
            
            // Decodificar os dados
            do {
                let parsed = try JSONDecoder().decode([Times].self, from: data)
                DispatchQueue.main.async {
                    self?.time = parsed
                    self?.isLoading = false 
                }
            } catch {
                DispatchQueue.main.async {
                    print("Erro ao decodificar os dados JSON: \(error)")
                    self?.isLoading = false
                }
            }
        }
        
        task.resume()
    }
}

