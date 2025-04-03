import SwiftUI

struct MaintenanceView: View {
    @State private var selectedDate = Date()
    
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                Text("Manutenção de Serviço")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Text("Selecione uma data para agendar a manutenção:")
                    .font(.headline)
                    .padding(.top, 20)
                
                DatePicker("Data", selection: $selectedDate, displayedComponents: [.date])
                    .datePickerStyle(WheelDatePickerStyle())
                    .padding()
                
                Button(action: {
                    // Ação ao confirmar agendamento
                }) {
                    Text("Confirmar Agendamento")
                        .font(.title2)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(15)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    MaintenanceView()
}

