import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                
                AsyncImage(
                    url: URL(string: "https://s2.glbimg.com/gJ9PPo0qCwwINEgxrpgt4WanlT8=/smart/e.glbimg.com/og/ed/f/original/2020/06/30/gettyimages-592601718.jpg"),
                    content: { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 250)
                            .clipped()
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                .ignoresSafeArea(edges: .top)
                
                
                if viewModel.isLoading {
                    ProgressView("Carregando...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .green))
                        .padding()
                }
                
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(viewModel.time, id: \.id) { time in
                            NavigationLink(destination: CharView(time: time)) {
                                HStack(spacing: 16) {
                                    
                                    
                                    if let imageUrl = time.emblemaUrl, let url = URL(string: imageUrl) {
                                        AsyncImage(url: url) { image in
                                            image
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 100, height: 100)
                                                .clipShape(Circle())
                                                .overlay(Circle().stroke(Color.white, lineWidth: 3))
                                        } placeholder: {
                                            ProgressView()
                                                .frame(width: 100, height: 100)
                                        }
                                    } else {
                                        ProgressView()
                                            .frame(width: 100, height: 100)
                                    }
                                    
                                    Text(time.nome ?? "Nome desconhecido")
                                        .foregroundColor(.black)
                                        .font(.title3)
                                        .bold()
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(15)
                                .shadow(radius: 5)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .background(Color.green)
            }
            .background(Color.white)
            .navigationBarHidden(true)
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}



#Preview {
    ContentView()
}

