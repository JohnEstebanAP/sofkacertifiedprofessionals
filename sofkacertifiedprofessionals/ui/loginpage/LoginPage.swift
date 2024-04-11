//
//  LoginPage.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 11/04/24.
//

import SwiftUI

struct LoginPage:View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.colorScheme) var colorScheme
    
    @State private var signInResult: Bool? = nil
    
    @State private var isShowingMenu = false
    @State private var isShowingSearchable = false
    @State private var selectedMenuItem = 0
    
    
    var body: some View {
        ZStack{
            
            //Fondo de la pantalla del login
            Image("login")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(x:-254,y: 0)
                .overlay(Color.black.opacity(0.8))
            
            //TopBarLite()
            
            
            
            VStack(alignment: .center) {
                Image("sofka_logo").resizable().scaledToFit().padding(50)
                Spacer()
                Text("Ingresa para encontrar a los mejores profesionales certificados") .multilineTextAlignment(.center)
                    .padding()
                    .foregroundColor(.orange)
                    .font(.system(size: 25))
                Button(action: {
                    viewModel.singInWithGoogle { success in
                        signInResult = success
                    }
                }) {
                    Text("Ingresar con Google")
                        .foregroundColor(.white.opacity(0.9))
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(alignment: .leading) {
                            Image("Google").resizable().scaledToFit()
                                .frame(width: 40, alignment: .center).padding(.leading,15)
                        }
                        .background(.white.opacity(0.5))
                        .cornerRadius(15).padding()
                }
                .padding()
                
                if let result = signInResult {
                    Text("Resultado del login: \(result ? "Éxito" : "Fracaso")")
                        .foregroundColor(result ? .green : .red)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    LoginPage()
}
