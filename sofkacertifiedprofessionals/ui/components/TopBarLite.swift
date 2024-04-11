//
//  TopBarLite.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 11/04/24.
//

import SwiftUI


struct TopBarLite: View {
    var body: some View {
        Spacer()
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("logo_sofka")
                        .resizable()
                        .frame(width: 120, height: 35)
                }
            }
    }
}
