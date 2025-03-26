import SwiftUI

struct CharView: View {
    var p: Personagem

    var body: some View {
        VStack(spacing: 20) {
            
            if let imageUrl = p.image, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 250, height: 250)
            } else {
                ProgressView()
                    .frame(width: 250, height: 250)
            }

            
            Text(p.name ?? "Nome desconhecido")
                .font(.largeTitle)
                .bold()
            
           
            Text("Casa: \(p.house ?? "Desconhecida")")
                .font(.title3)

            
            Text("Ator: \(p.actor ?? "Desconhecido")")
                .font(.title3)
            
            Text("Data de nascimento: \(p.dateOfBirth ?? "Desconhecida")")
                .font(.title3)
            
           
            Text("É bruxo? \(p.wizard == true ? "Sim" : "Não")")
                .font(.title3)

            Spacer()
        }
        .padding()
        .navigationTitle(p.name ?? "Personagem")
    }
}

