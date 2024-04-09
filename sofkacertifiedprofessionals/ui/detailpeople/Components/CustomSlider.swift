//
//  CustomSlider.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 9/04/24.
//

import SwiftUI

struct CustomSlider: View {
    
    var listimg: [String]
    
    var body: some View {
        TabView{
            ForEach(listimg, id: \.self){
                item in
                AsyncImage(url: URL(string: item ))
                { image in
                    image.resizable()
                        .scaledToFill()
                        .cornerRadius(20)
                        .padding()
                }placeholder:{
                     ProgressView()
                    }
            }
        }.frame(width: 300, height: 200)
            .tabViewStyle(PageTabViewStyle()).cornerRadius(20)
        
        
    }
}

