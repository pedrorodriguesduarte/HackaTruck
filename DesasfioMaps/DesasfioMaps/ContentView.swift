import SwiftUI
import MapKit

struct Location: Identifiable, Hashable {
    let id = UUID()
    let nome: String
    let foto: String
    let descricao: String
    let latitude: Double
    let longitude: Double
}

struct ContentView: View {
    let locations: [Location] = [
        Location(nome: "Base Aérea de Natal",
                 foto: "https://images8.alphacoders.com/369/369647.jpg",
                 descricao: "A Base Aérea de Natal é uma base da Força Aérea Brasileira localizada em Parnamirim, no estado do Rio Grande do Norte, la o Aspira Duarte, trabalha. ",
                 latitude: -5.91117,
                 longitude: -35.24972),
        
        Location(nome: "Colégio Chromos Pampulha",
                 foto: "https://images.alphacoders.com/136/1362876.png",
                 descricao: "O Colégio Chromos Pampulha é uma unidade da rede de ensino Chromos, localizada na região da Pampulha em Belo Horizonte. O Diretor Sergio é um bonitao.",
                 latitude: -19.86543,
                 longitude: -43.97021),
        
        Location(nome: "Colégio Cecília Meireles - Santo Agostinho",
                 foto: "https://images2.alphacoders.com/802/802432.jpg",
                 descricao: "O Colégio Cecília Meireles é uma instituição de ensino localizada no bairro Santo Agostinho, em Belo Horizonte. A professora Elaine Duarte é a melhor e a mais linda.",
                 latitude: -19.92278,
                 longitude: -43.94583),
        
        Location(nome: "Parque Temático Naruto & Boruto",
                 foto: "https://images3.alphacoders.com/135/135625.jpg",
                 descricao: "Localizado no parque Nijigen no Mori, na Ilha Awaji, o parque temático traz atrações inspiradas no universo de Naruto e Boruto.",
                 latitude: 34.5922,
                 longitude: 134.9984),
        
        Location(nome: "Reriz, Portugal",
                 foto: "https://images4.alphacoders.com/129/1299844.jpg",
                 descricao: "Uma pequena freguesia em Portugal, famosa por sua tranquilidade e belas paisagens naturais. Seu Antonio veio dessa grota e hoje porta malote",
                 latitude: 41.2486,
                 longitude: -8.3022),
        
        Location(nome: "Petra, Jordânia",
                 foto: "https://images5.alphacoders.com/503/503900.jpg",
                 descricao: "Uma cidade histórica esculpida em rochas vermelhas, famosa por sua arquitetura impressionante.",
                 latitude: 30.3285,
                 longitude: 35.4444),
        
        Location(nome: "Machu Picchu, Peru",
                 foto: "https://picfiles.alphacoders.com/230/230764.jpg",
                 descricao: "Uma antiga cidade inca situada nos Andes, um dos destinos turísticos mais icônicos do mundo.",
                 latitude: -13.1631,
                 longitude: -72.5450)
    ]
    
    @State private var selectedLocation: Location
    @State private var position: MapCameraPosition
    @State private var showSheetLocation: Location? = nil

    init() {
        let initialLocation = locations.first!
        _selectedLocation = State(initialValue: initialLocation)
        _position = State(initialValue: MapCameraPosition.region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: initialLocation.latitude, longitude: initialLocation.longitude),
                span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10))
        ))
    }
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                ForEach(locations) { location in
                    Annotation(location.nome, coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                        Image(systemName: "mappin.circle.fill")
                            .foregroundColor(.red)
                            .font(.title)
                            .onTapGesture {
                                showSheetLocation = location
                                position = MapCameraPosition.region(
                                    MKCoordinateRegion(
                                        center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude),
                                        span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2))
                                )
                            }
                    }
                }
            }
            .ignoresSafeArea()
            
            VStack {
                Picker("Escolha um local", selection: $selectedLocation) {
                    ForEach(locations, id: \.self) { location in
                        Text(location.nome).tag(location)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .padding()
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                .padding(.top, 50)
                
                Spacer()
            }
        }
        .onChange(of: selectedLocation) { newLocation in
            position = MapCameraPosition.region(
                MKCoordinateRegion(
                    center: CLLocationCoordinate2D(latitude: newLocation.latitude, longitude: newLocation.longitude),
                    span: MKCoordinateSpan(latitudeDelta: 2, longitudeDelta: 2))
            )
        }
        .sheet(item: $showSheetLocation) { location in
            VStack {
                if let url = URL(string: location.foto) {
                    AsyncImage(url: url) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 200)
                        case .success(let image):
                            image.resizable()
                                 .scaledToFit()
                                 .frame(height: 200)
                        case .failure:
                            Text("Falha ao carregar a imagem")
                        @unknown default:
                            Text("Erro desconhecido")
                        }
                    }
                }
                
                Text(location.nome)
                    .font(.title)
                    .padding()
                
                Text(location.descricao)
                    .padding()
            }
            .presentationDetents([.medium, .large])
        }
    }
}

#Preview {
    ContentView()
}

