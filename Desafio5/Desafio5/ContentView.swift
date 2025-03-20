import SwiftUI

struct ContentView: View {
    @State private var distancia = 0
    @State private var tempo = 0
    @State private var resultado: Double? = nil
    @State private var cor = Color.corFundo
    @State private var img: String = "duvida"
    @State private var showAlert = false

    var body: some View {
        ZStack {
            cor
                .ignoresSafeArea()

            VStack {
                Text("Coloque uma Distancia (km)")
                    .foregroundColor(Color.white)
                TextField("", value: $distancia, format: .number)
                    .frame(width: 200.0)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                VStack {
                    Text("Coloque o tempo (h)")
                        .foregroundColor(Color.white)
                    TextField("", value: $tempo, format: .number)
                        .frame(width: 200.0)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }

                Button("Calcular") {
                    if tempo != 0 {
                        resultado = Double(distancia) / Double(tempo)
                        mudarCorImagem()
                    } else {
                        showAlert = true
                    }
                }
                .frame(width: 200, height: 50)
                .background(Color.white)
                .foregroundColor(.black)
                .cornerRadius(10)

                if let resultado = resultado {
                    Text("Resultado: \(String(format: "%.2f", resultado)) km/h")
                        .foregroundColor(Color.white)
                        .padding()
                }

                Spacer()

                VStack {
                    Spacer()
                    Image(img)
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 200, height: 200)
                }

                Spacer()

                VStack {
                    Text("Legenda:")
                        .foregroundColor(.white)
                        .font(.headline)

                    HStack {
                        legendaItem(cor: .white, texto: "UNO MILE (0-10 KM/H)")
                        legendaItem(cor: .blue, texto: "RENEGADE (11-30 KM/H)")
                    }
                    HStack {
                        legendaItem(cor: .green, texto: "CIVIC (31-50 KM/H)")
                        legendaItem(cor: .orange, texto: "LAMBORGHINI (51-110 KM/H)")
                    }
                    HStack {
                        legendaItem(cor: .red, texto: "BUGATTI (110+ KM/H)")
                    }
                }
                .padding()
                .background(Color.black)
                .cornerRadius(10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Erro"), message: Text("Tempo não pode ser zero!"), dismissButton: .default(Text("OK")))
            }
        }
    }

    func legendaItem(cor: Color, texto: String) -> some View {
        HStack {
            Circle()
                .fill(cor)
                .frame(width: 20, height: 20)
            Text(texto)
                .foregroundColor(.white)
        }
        .padding(5)
    }

    func mudarCorImagem() {
        if let resultado = resultado {
            if resultado <= 10 {
                cor = Color.corFundo
                img = "uno"
            } else if resultado <= 30 {
                cor = Color.cor2
                img = "renegade"
            } else if resultado <= 50 {
                cor = Color.cor3
                img = "civic"
            } else if resultado <= 110 {
                cor = Color.cor4
                img = "lambo"
            } else {
                cor = Color.cor5
                img = "bughati"
            }
        }
    }
}

#Preview {
    ContentView()
}

