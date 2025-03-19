import SwiftUI

struct ContentView: View {
    // Estado para controlar a troca da imagem e dos textos
    @State private var isFirstImage = true
    
    var body: some View {
        VStack {
            HStack {
                
                Image(isFirstImage ? "Naruto" : "Sasuke")
                    .resizable()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                
                VStack {

                    Text(isFirstImage ? "Naruto Uzumaki" : "Sasuke Uchiha")
                        .foregroundColor(Color.orange)
                    Text(isFirstImage ? "Aldeia da Folha" : "Renegadinho de bosta")
                        .foregroundColor(Color.green)
                    Text(isFirstImage ? "Jutsu Multiclones da sombra" : " Jutsu de tchola Chidori")
                        .foregroundColor(Color.blue)
                }
            }
            .padding()
            
           
            Button(action: {
                
                isFirstImage.toggle()
            }) {
                Text("Trocar ")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
