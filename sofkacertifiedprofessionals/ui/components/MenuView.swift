//
//  MenuView.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 3/04/24.
//

import SwiftUI

struct MenuView: View {
    @Binding var isShowingMenu: Bool
    @Binding var selectedMenuItem: Int
    
    var body: some View {
        
        GeometryReader{ geometry in
            ZStack {
                HStack{
                    Color(red: 5/255, green: 6/255, blue: 47/255)
                        .edgesIgnoringSafeArea(.all)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .transition(.move(edge: .leading))
                        .animation(.easeInOut)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: geometry.size.width * 0.2)
                        .onTapGesture {
                            isShowingMenu.toggle()
                        }
                }
                
                HStack{
                    List {
                        Button(action: {
                            selectedMenuItem = 0
                            withAnimation {
                                isShowingMenu.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "house")
                                    .foregroundColor(Color(red: 225/255, green: 225/255, blue: 225/255))
                                Text("Inicio")
                            }
                        }
                        .listRowBackground(Color(red: 5/255, green: 6/255, blue: 47/255))
                        .padding(.top, 20)
                        
                        Button(action: {
                            selectedMenuItem = 1
                            withAnimation {
                                isShowingMenu.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color(red: 225/255, green: 225/255, blue: 225/255))
                                Text("Busqueda")
                            }
                        }
                        .listRowBackground(Color(red: 5/255, green: 6/255, blue: 47/255))
                        
                        Button(action: {
                            selectedMenuItem = 2
                            withAnimation {
                                isShowingMenu.toggle()
                            }
                        }) {
                            HStack {
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(Color(red: 225/255, green: 225/255, blue: 225/255))
                                Text("Profesionales")
                            }
                        }
                        .listRowBackground(Color(red: 5/255, green: 6/255, blue: 47/255))
                    }
                    .listStyle(.plain)
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .transition(.move(edge: .leading))
                    .animation(.easeInOut)
                    .foregroundColor(.white)
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(width: geometry.size.width * 0.2)
                    
                        .contentShape(Rectangle())
                        .onTapGesture {
                            isShowingMenu.toggle()
                        }
                }
            }
            .frame(height: geometry.size.height)
            .offset(x: isShowingMenu ? 0 : -geometry.size.width)
            .animation(.easeInOut)
        }
    }
}

