//
//  TopBar.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 2/04/24.
//
import SwiftUI

struct TopBar:View {
    var onShowingMenu: () -> Void
    var onShowingSearchable: () -> Void
    var body: some View {
        Spacer()
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        onShowingMenu()
                    }) {
                        Image(systemName: "line.horizontal.3") .foregroundColor(Color(red:225/255, green: 225/255, blue:225/255))
                    }
                }
                ToolbarItem(placement: .principal) {
                    Image("logo_sofka")
                        .resizable()
                        .frame(width: 120, height: 35)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        onShowingSearchable()
                    }) {
                        Image(systemName: "magnifyingglass").foregroundColor(Color(red: 225/255, green: 225/255, blue: 225/255))
                    }
                }
            }
    }
}

#Preview {
    PreviewTopBar()
}

struct PreviewTopBar: View {
    
    
    var body: some View {
        NavigationView{
            TopBar(onShowingMenu: {},onShowingSearchable: {})
        }
    }
}
