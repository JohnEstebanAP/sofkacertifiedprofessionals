//
//  NavigationController.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 1/04/24.
//

import SwiftUI


struct NavigationController: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 5/255, green: 6/255, blue: 47/255, alpha: 1)
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    @State private var isShowingMenu = true
    @State private var selectedMenuItem = 0
    
    
    var body: some View {
        NavigationView {
            ZStack{
                TopBar(isShowingMenu: $isShowingMenu)
                TabView(selection: $selectedMenuItem){
                    Home(onMenuItemSelected: { menuItem in
                        selectedMenuItem = menuItem
                    })
                    .tabItem{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.tag(0)
                    Text("Page busqueda")
                        .tabItem{
                            Image(systemName: "magnifyingglass")
                            Text("Busqueda")
                        }.tag(1)
                    Text("Page profecionales")
                        .tabItem{
                            Image(systemName: "person.2.fill")
                            Text("Page profecionales")
                        }.tag(2)
                }
                
                if isShowingMenu {
                    MenuView(isShowingMenu: $isShowingMenu, selectedMenuItem: $selectedMenuItem)
                }
            }
        }
    }
}


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



                            					             
struct TopBar:View {
    @Binding var isShowingMenu: Bool
    var body: some View {
        Spacer()
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {withAnimation {
                        isShowingMenu.toggle()
                    }
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
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(Color(red: 225/255, green: 225/255, blue: 225/255))
                    }
                }
            }
    }
}

#Preview {
    NavigationController()
}


