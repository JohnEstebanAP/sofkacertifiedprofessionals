//
//  TabViewGeneri.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 3/04/24.
//

import SwiftUI

struct TabViewGeneri: View{
    @State var filterService: Int = 0
    
    @Binding var selectedMenuItem: Int

    var body: some View{
        TabView(selection: $selectedMenuItem){
            Home(onMenuItemSelected: { menuItem, indexFilterSErvice in
                filterService = indexFilterSErvice
                selectedMenuItem = menuItem
            })
            .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }.tag(0)
            
            SearchPeoplePage(filterService: filterService)
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
    }
}
