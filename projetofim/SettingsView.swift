//
//  SettingsView.swift
//  projetofim
//
//  Created by Turma01-5 on 03/04/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color(.systemGray6)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Configurações")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}

