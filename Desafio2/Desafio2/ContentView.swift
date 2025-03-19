//
//  ContentView.swift
//  Desafio2
//
//  Created by Turma01-24 on 19/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            
            Image("Naruto")
                .resizable()
                .frame(width : 120, height: 120)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            
            VStack{
                Text("Naruto Uzumaki")
                    .foregroundColor(Color.green)
                Text("Aldeia da Folha")
                    .foregroundColor(Color.blue)
                Text("Jutsu Multiclones da sombra")
                    .foregroundColor(Color.orange)
            }
            
            
            
        }
        
        .padding()
    }
}

#Preview {
    ContentView()
}
