import SwiftUI

struct DeviceDetailView: View {
    let device: Device
    @State private var selectedTime = Date()
    @State private var showDatePicker = false
    @State private var isScheduled = false
    @Environment(\.presentationMode) var presentationMode 

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text(device.name)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 20)

                HStack(spacing: 40) {
                    VStack {
                        Image(systemName: "sun.max.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.yellow)
                        Text("23ºC")
                    }

                    VStack {
                        Image(systemName: "drop.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                        Text("45%")
                    }
                }
                .padding(.top, 20)

                VStack(spacing: 15) {
                    Toggle("Habilitar acionamento com horário definido", isOn: $isScheduled)
                        .padding()
                    
                    Button(action: {
                        showDatePicker.toggle()
                    }) {
                        Text("Selecionar Horário")
                            .font(.title2)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                    }
                    
                    if showDatePicker {
                        DatePicker("Escolha um horário", selection: $selectedTime, displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .datePickerStyle(WheelDatePickerStyle())
                            .transition(.opacity)
                    }
                }
                .padding()

                Spacer()
            }
            .padding()
            .animation(.easeInOut, value: showDatePicker)
            .navigationBarTitle("Detalhes", displayMode: .inline) // Define o título na barra de navegação
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss() // Ação de voltar
            }) {
                HStack {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.blue)
                    Text("Voltar")
                        .foregroundColor(.blue)
                }
            })
        }
    }
}

#Preview {
    DeviceDetailView(device: Device(name: "Detalhes"))
}

