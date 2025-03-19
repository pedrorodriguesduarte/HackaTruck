//
//  ContentView.swift
//  Desafio1
//
//  Created by Turma01-24 on 19/03/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack{
                Rectangle().foregroundColor(.yellow)
                    .frame(height: 80)
                    .frame(width: 80)
                Spacer()
                Rectangle().foregroundColor(.red)
                    .frame(height: 80)
                    .frame(width: 80)
                
            }
        }
        
        
       
        
        Spacer()
        HStack{
            
            Rectangle().foregroundColor(.yellow)
                .frame(height: 80)
                .frame(width: 80)
            Spacer()
            
            Rectangle().foregroundColor(.blue)
                .frame(height: 80)
                .frame(width: 80)
                        }
        
        
        
        
        .padding()
    }
}

#Preview {
    ContentView()
}
