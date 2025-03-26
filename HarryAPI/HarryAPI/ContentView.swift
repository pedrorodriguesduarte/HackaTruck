import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                
                AsyncImage(
                    url: URL(string: "https://wallpapercave.com/wp/52ZIgqs.png"),
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
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(viewModel.chars) { p in
                            NavigationLink(destination: CharView(p: p)) {
                                HStack(spacing: 16) {
                                    if let imageUrl = p.image, let url = URL(string: imageUrl) {
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
                                    
                                    Text(p.name ?? "Nome desconhecido")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .bold()
                                    
                                    Spacer()
                                }
                                .padding()
                                .background(Color(red: 117/255, green: 0, blue: 0))
                                .cornerRadius(15)
                            }
                            .padding(.horizontal)
                        }
                    }
                    .padding(.vertical)
                }
                .background(Color(red: 64/255, green: 0, blue: 0))
            }
            .background(Color(red: 64/255, green: 0, blue: 0))
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ContentView()
}

