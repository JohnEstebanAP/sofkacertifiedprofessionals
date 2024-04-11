//
//  NavigationController.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 1/04/24.
//

import SwiftUI


struct NavigationController: View {
    @State private var isShowingMenu = false
    @State private var isShowingSearchable = false
    @State private var selectedMenuItem = 0
    
    var body: some View {
        ZStack{
            TopBar(
                onShowingMenu: {
                    withAnimation {
                        isShowingMenu.toggle()
                        if (isShowingSearchable){
                            isShowingSearchable.toggle()
                        }
                    }
                },
                onShowingSearchable:{
                    withAnimation {
                        isShowingSearchable.toggle()
                        if(isShowingMenu){
                            isShowingMenu.toggle()
                        }
                    }
                }
            )
            TabViewGeneri(selectedMenuItem: $selectedMenuItem)
            
            if isShowingMenu {
                MenuView(isShowingMenu: $isShowingMenu, selectedMenuItem: $selectedMenuItem)
            }
            if isShowingSearchable {
                SearchablePeople(
                    onShowingSearchable: {
                        withAnimation {
                            isShowingSearchable.toggle()
                        }
                    })
            }
        }
    }
}

#Preview {
    NavigationController()
}


