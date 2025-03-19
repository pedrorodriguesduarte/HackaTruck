//
//  ContentView.swift
//  Aula1
//
//  Created by Turma01-24 on 19/03/25.
//

import SwiftUI

struct ContentView: View {
   
    // Onde é criado as variaveis
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .foregroundColor(Color.green)
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(.largeTitle)
                .foregroundColor(Color.green)
        }
        
        HStack {
            Text ("I cant see")
                .font(.title2)
                .foregroundColor(Color.purple)
        }
        
        
        
        
        
        .padding()
    }
}

#Preview {
    ContentView()
}
