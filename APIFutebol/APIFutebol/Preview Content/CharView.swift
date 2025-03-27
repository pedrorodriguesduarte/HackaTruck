import SwiftUI

struct CharView: View {
    var time: Times

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                
                Text(time.nome ?? "Nome desconhecido")
                    .font(.largeTitle)
                    .bold()
                    .padding()

               
                if let dataFundacao = time.dataFundacao, let date = dateFormatter.date(from: dataFundacao) {
                    Text("Fundado em: \(dateFormatter.string(from: date))")
                        .font(.title2)
                        .padding(.bottom, 10)
                } else {
                    Text("Data de fundação: Não disponível")
                        .font(.title2)
                        .padding(.bottom, 10)
                }
                
                // Exibir a torcida organizada
                Text("Torcida Organizada: \(time.torcidaOrganizada ?? "Não disponível")")
                    .font(.title2)
                    .padding(.bottom, 10)

                // Emblema do time
                if let emblemaUrl = time.emblemaUrl, let url = URL(string: emblemaUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 200)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 100, height: 100)
                    }
                } else {
                    Text("Emblema não disponível")
                        .font(.title2)
                        .padding(.top, 10)
                }
            }
            .padding()
            .background(Color.green)
            .cornerRadius(10)
            .foregroundColor(.white)
        }
        .navigationTitle("Detalhes do Time")
    }
}

// Função para formatar a data
let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    return formatter
}()


