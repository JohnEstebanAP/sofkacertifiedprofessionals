//
//  sofkacertifiedprofessionalsApp.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 1/04/24.
//

import SwiftUI
import SwiftData

@main
struct sofkacertifiedprofessionalsApp: App {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 5/255, green: 6/255, blue: 47/255, alpha: 1)
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some Scene {
        WindowGroup {
          NavigationController()
        }
    }
}
