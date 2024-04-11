//
//  AuthenticationViewModel.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 10/04/24.
//

import Foundation
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift
import FirebaseCore
import SwiftUI

class AuthenticationViewModel: ObservableObject{
    @Published var isAuthenticated: Bool = false
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isValid: Bool = false
    @Published var user: User?
    @Published var errorMessage: String = ""
    
    func singInWithGoogle(completion: @escaping (Bool) -> Void) {
        guard let clientID = FirebaseApp.app()?.options.clientID else {
           completion(false)
           return
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let rootViewController = UIApplication.shared.windows.first?.rootViewController else {
            print("No hay controlador de vista raíz o ventana principal")
            completion(false)
            return
        }
        
        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                print("Error al iniciar sesión con Google: \(error.localizedDescription)")
                completion(false)
                return
            }
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                print("No se pudo obtener el usuario de Google")
                completion(false)
                return
            }
            
            
            let accessToken = user.accessToken.tokenString
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Error al iniciar sesión en Firebase con Google: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                let correoValido = self.validarCorreo(user.profile?.email ?? "")
                self.isAuthenticated = correoValido
                completion(correoValido)
            }
        }
    }
    
    func validarCorreo(_ correo: String) -> Bool {
        let dominioEsperado = "@sofka.com.co"
        // Verificar si el correo contiene el dominio esperado
        guard correo.hasSuffix(dominioEsperado) else {
            return false
        }
        // Validar que el correo tenga el formato apropiado (opcional)
        let formatoCorreo = "[A-Z0-9a-z._%+-]+@sofka\\.com\\.co"
        let predicado = NSPredicate(format: "SELF MATCHES %@", formatoCorreo)
        return predicado.evaluate(with: correo)
    }
    
    func singInWithGoogle2() async ->Bool{
        guard let clientID = FirebaseApp.app()?.options.clientID else{
            fatalError("No client ID Found in firebase configuration")
            return false
        }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        guard let rootViewController = await UIApplication.shared.windows.first?.rootViewController else {
            print("No hay controlador de vista raíz o ventana principal")
            return false
        }
        
        do {
            let userAuthentication = try await  GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            let user = userAuthentication.user
            guard let idTokend = user.idToken else{
                throw AuthenticationError.tokenError(message: "ID token missing")
            }
            let accessToken = user.accessToken
            let credential = GoogleAuthProvider.credential(withIDToken: idTokend.tokenString, accessToken: accessToken.tokenString)
            
            let result = try await Auth.auth().signIn(with: credential)
            let firebaseUser = result.user
            print("User \(firebaseUser.uid) signed in with email \(firebaseUser.email ??  "unknown")")
            return true
        }catch{
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
            return false
        }
        return false
    }
    
}

enum AuthenticationError: Error{
    case tokenError(message: String)
}

enum AuthenticationState{
    case unauthenticated
    case authenticating
    case authenticated
}
