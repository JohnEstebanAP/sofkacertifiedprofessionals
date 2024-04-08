//
//  ContentView.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 1/04/24.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = ViewModelHome()
    var listCloudServices: [String] = CloudService.allList
    var onMenuItemSelected: (Int, Int) -> Void
    let orangeColor = Color.orange // Adjust hue based on text count
    let darkColor = Color(red: 5/255 , green: 6/255, blue: 47/255)
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            ScrollView(.horizontal){}.frame(height: 0)
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Spacer()
                    Text("Catálogo de nuestros profesionales certificados").fontWeight(.bold).font(.system(size: 20)).padding(.top, 14).padding(.horizontal, 8)
                    Text("Buscando ser un aliado estratégico para nuestros clientes, aportando soluciones tecnológicas que impulsen a las empresas a destacarse en entornos cada vez más competitivos.  Brindamos este catálogo con nuestros profesionales de Sofka certificados en tecnologías de punta.")
                        .font(.system(size: 11)).padding(.vertical,14).padding(.horizontal, 8)
                    Image("img_home").resizable().frame(width: 268, height: 228)
                    Spacer()
                }
                GraphisBar(listObjects: listCloudServices, color1: orangeColor, color2: darkColor, onOptionSelected: { index in
                    onMenuItemSelected(1, index)
                })
                
                ZStack{
                    Color(red: 230/255, green: 230/255, blue: 230/255)
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Spacer()
                        Button(action: {
                            onMenuItemSelected(1, 0)
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
}

