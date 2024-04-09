//
//  HelpPage.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 9/04/24.
//

import Foundation
import SwiftUI

struct HelpPage: View {
    var body: some View {
        ScrollView {
            VStack{
                Text("Contáctanos").fontWeight(.bold).foregroundColor(.orange).font(.system(size: 30))
                    .padding(.top,20)
                    .padding(.bottom, 40)
                
                Text(" comercial@sofka.com.co").foregroundColor(.white)
                Text("+57 (604) 2668907").foregroundColor(.white)
                
                VStack(alignment: .leading){
                    Text("Oficinas").fontWeight(.bold).foregroundColor(.orange).font(.system(size: 25)).padding(.top, 40).padding(.bottom,20)
                    
                    Text("Colombia").fontWeight(.bold).foregroundColor(.white).fontWeight(.bold)
                    
                    DetailOffice(city: "Medellín:", address: "Calle 12 # 30 – 80")
                    
                    DetailOffice(city: "Bogotá:", address: "Paralelo 108 Av. Carrera 45 No. 108-27 Torre 2 Oficina 1103")
                    
                    Text("EE.UU.").fontWeight(.bold).foregroundColor(.white).fontWeight(.bold)
                    DetailOffice(city: "Miami:", address: "520 Brickell Key One, Unit 1410")
                    
                    Text("México").fontWeight(.bold).foregroundColor(.white).fontWeight(.bold)
                    DetailOffice(city: "Ciudad de México:", address: "Av. paseo de la reforma 284")
                    
                    Text("Uruguay").fontWeight(.bold).foregroundColor(.white).fontWeight(.bold)
                    DetailOffice(city: "Paysandú:", address: "Salto 919 Paysandú")
                    
                    Text("Ecuador").fontWeight(.bold).foregroundColor(.white).fontWeight(.bold)
                    DetailOffice(city: "Quito:", address: "Calle Azuay, Intersección Yugoslavia, Piso E2-36")
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 30)
                
                Spacer()
            }
        } .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(
                Color(red:16/255,green:8/255,blue:19/255)
            )
    }
}


#Preview {
    HelpPage()
}


struct DetailOffice:View {
    let city: String
    let address: String
    
    var body: some View {
        HStack(alignment: .firstTextBaseline){
            Text(".")
                .fontWeight(.bold)
                .font(.system(size: 50))
                .frame(height: 1)
                .foregroundColor(.white)
                .padding(.bottom,27)
            Text(city)
                .foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255))
            Text(address) .foregroundColor(Color(red: 155/255, green: 155/255, blue: 155/255))
        }.padding(.leading,10)
    }
}
