//
//  sofkacertifiedprofessionalsApp.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 1/04/24.
//

import SwiftUI
import SwiftData
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import GoogleSignInSwift

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                      didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
         FirebaseApp.configure()
         return true
     }

     func application(_ application: UIApplication,
                      open url: URL,
                      options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
         return GIDSignIn.sharedInstance.handle(url)
     }
}

@main
struct sofkacertifiedprofessionalsApp: App {
    @StateObject var viewModel = AuthenticationViewModel()

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 5/255, green: 6/255, blue: 47/255, alpha: 1)
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some Scene {
        WindowGroup {
            NavigationControllerView().environmentObject(viewModel)
        }
    }
}

struct NavigationControllerView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    var body: some View {
        NavigationView {
            if viewModel.isAuthenticated {
                NavigationController()
            } else {
                LoginPage()
            }
        }
    }
}
