//
//  ContentView.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 1/04/24.
//

import SwiftUI

struct Home: View {
    var onMenuItemSelected: (Int) -> Void
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            VStack{
                Spacer()
                Text("Búsqueda de certificados partner").fontWeight(.bold).font(.system(size: 20)).padding(.top, 14).padding(.horizontal, 8)
                Text("Usa el filtro de este buscador para encontrar los profecionales de Sofka certificados en Microsoft Azure, Amazon Web Serice(AWS) y Google Cloud Platform(GCP))")
                    .font(.system(size: 11)).padding(.vertical,14).padding(.horizontal, 8)
                Image("img_home").resizable().frame(width: 268, height: 228)
                Spacer()
            }
            ZStack{
                Color(red: 230/255, green: 230/255, blue: 230/255)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Button(action: {
                        onMenuItemSelected(1)
                    }) {
                        Text("Encontrar Sofkianos")
                            .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255))
                            .padding()
                            .background(Color.black)
                            .cornerRadius(8)
                    }.padding()
                    Spacer()
                }
            }.frame(height: 84)
        }
    }
}
