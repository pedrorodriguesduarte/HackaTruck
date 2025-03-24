import SwiftUI

struct Song: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var capa: String
}

struct ContentView: View {
    let arrayMusicas = [
        Song(id: 1, name: "Rap do Itachi", artist: "7 Minutoz", capa: "https://wallpapercave.com/wp/wp6319477.jpg"),
        Song(id: 2, name: "Look at Me", artist: "xxxTentacion", capa: "https://wallpapercave.com/wp/wp5358352.jpg"),
        Song(id: 3, name: "Rap do Sasori", artist: "7 Minutoz", capa: "https://wallpapercave.com/wp/wp2721271.jpg"),
        Song(id: 4, name: "Junho de 94", artist: "Djonga", capa: "https://wallpapercave.com/wp/wp4733870.png"),
        Song(id: 5, name: "LEAL", artist: "Djonga", capa: "https://wallpapercave.com/wp/wp4733876.jpg"),
        Song(id: 6, name: "Tropa do ORUAM", artist: "Oruan", capa: "https://wallpapercave.com/wp/wp12130834.jpg"),
        Song(id: 7, name: "Lucid Dreams", artist: "Juice Wrld", capa: "https://wallpapercave.com/wp/wp6964602.jpg"),
        Song(id: 8, name: "Rap da Akatsuki", artist: "7 Minutoz", capa: "https://wallpapercave.com/wp/wp7308029.gif"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Image("logomin")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .padding(.top, 40)
                    
                    Text("Duarte FM")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 20)
                    
                    ForEach(arrayMusicas) { song in
                        NavigationLink(destination: MusicDetailView(song: song)) {
                            HStack {
                                AsyncImage(url: URL(string: song.capa)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 70, height: 70)
                                        .cornerRadius(0)
                                } placeholder: {
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.3))
                                        .frame(width: 400, height: 400)
                                        .cornerRadius(10)
                                }
                                
                                VStack(alignment: .leading) {
                                    Text(song.name)
                                        .foregroundColor(.white)
                                        .font(.headline)
                                    Text(song.artist)
                                        .foregroundColor(.gray)
                                        .font(.subheadline)
                                }
                                Spacer()
                                Image(systemName: "ellipsis")
                                    .foregroundColor(.white)
                            }
                            .padding()
                        }
                        .padding(.vertical, 5)
                    }
                    
                    Text("Álbuns Sugeridos")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 30) {
                            AlbumView(name: "Familia Duarte", image: "familia")
                            AlbumView(name: "Aviao do Bi", image: "solit")
                        }
                        .padding()
                    }
                }
            }
            .background(LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all))
        }
    }
}

struct MusicDetailView: View {
    let song: Song
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.green, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                AsyncImage(url: URL(string: song.capa)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                } placeholder: {
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                        .frame(width: 200, height: 200)
                        .cornerRadius(10)
                }
                
                Text(song.name)
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .padding(.top, 40)
                
                Text(song.artist)
                    .foregroundColor(.gray)
                    .font(.subheadline)
                    .padding(.bottom, 40)
                
                HStack(spacing: 40) {
                    Image(systemName: "shuffle")
                    Image(systemName: "backward.end.fill")
                    Image(systemName: "play.fill")
                        .font(.largeTitle)
                    Image(systemName: "forward.end.fill")
                    Image(systemName: "repeat")
                }
                .foregroundColor(.white)
                .font(.title)
                .padding(.top, 20)
            }
        }
    }
}

struct AlbumView: View {
    let name: String
    let image: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .cornerRadius(10)
            
            Text(name)
                .foregroundColor(.white)
                .font(.caption)
                .bold()
                .multilineTextAlignment(.center)
                .frame(width: 150)
        }
    }
}

#Preview {
    ContentView()
}

