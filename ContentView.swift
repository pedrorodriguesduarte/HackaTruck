import SwiftUI

struct ContentView: View {
    let devices = ["Varal", "Cortina", "Ar-Condicionado", "Robô Aspirador"].map { Device(name: $0) }
    
    var body: some View {
        NavigationStack {
            ZStack {
               
               
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.6), Color.purple.opacity(0.6)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()
                
                VStack {
                    Text("MEUS ITENS")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    List(devices) { device in
                        NavigationLink(destination: DeviceDetailView(device: device)) {
                            HStack {
                                Image(systemName: "house.fill")
                                    .foregroundColor(.white)
                                    .font(.title2)
                                Text(device.name)
                                    .font(.title2)
                                    .padding()
                                    .foregroundColor(.white)
                            }
                        }
                        .listRowBackground(Color.blue.opacity(0.3))
                    }
                    .frame(height: 300)
                    .scrollContentBackground(.hidden)
                    .background(Color.white.opacity(0.2))
                    .cornerRadius(15)

                    Spacer()
                    
                    VStack(spacing: 10) {
                        NavigationLink(destination: SettingsView()) {
                            Text("Configurações")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white.opacity(0.3))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                        
                        NavigationLink(destination: MaintenanceView()) {
                            Text("Manutenção de Serviço")
                                .font(.title2)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.red.opacity(0.7))
                                .foregroundColor(.white)
                                .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 30)
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

