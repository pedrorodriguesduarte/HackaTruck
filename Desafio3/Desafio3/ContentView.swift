import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            Text("Bem-vindo, \(name)")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Username", text: $name)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Spacer()
            
            ZStack {
                Image("Caminhao")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .opacity(0.2)
                    .blur(radius: 3)

                VStack {
                    Spacer()

                    Image("logo-topo")
                        .frame(width: 75.0, height: 80)
                        
                    Spacer()
                }

                VStack {
                    Spacer()
                    Button("Entrar") {
                        showingAlert = true
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("ALERTA"),
                            message: Text("VOCÊ VAI COMEÇAR O DESAFIO DO HACKTRUCK"),
                            primaryButton: .default(Text("COMECAR")) {
                               
                            },
                            secondaryButton: .cancel()
                        )
                    }
                    .padding()
                    .background(Color("AccentColor"))
                    .foregroundColor(.blue)
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color.white.opacity(0.7))
    }
}

#Preview {
    ContentView()
}

