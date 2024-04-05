//
//  GraphisBar.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 5/04/24.
//

import SwiftUI

struct GraphisBar: View {
    
    @StateObject var viewModel = ViewModelHome()
    var listObjects: [CloudService]
    var color1: Color
    var color2: Color
    var onOptionSelected: (Int) -> Void
    var body: some View {
        let countData = self.listObjects.count
        
        VStack(alignment: .leading){
            ForEach(0..<countData){ index in
                let countCertifiers = viewModel.countCertifiedCloud(index: index)
                Button(action: {
                    onOptionSelected(index)
                }) {
                    VStack{
                        HStack{
                            Text(listObjects[index].rawValue)
                                .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255))
                                .padding(.vertical,10)
                                .padding(.horizontal,15)
                            Spacer()
                            Text("\(countCertifiers)").padding(.horizontal,20)
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .background(
                            GeometryReader{
                                geometry in
                                LinearGradient(stops: [
                                    Gradient.Stop(color: color1, location: 0.82),
                                    Gradient.Stop(color: color2, location: 0.90),
                                ], startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                                .cornerRadius(50)
                                .padding(.trailing, geometry.size.width /
                                         ( CGFloat((countCertifiers))))
                            }
                        )
                    }            
                    .frame(minWidth: 0, maxWidth: .infinity, alignment:.leading)
                    .background(
                        GeometryReader{ geometry in
                            Color(red: 5/255, green: 6/255, blue: 47/255)
                            .mask(
                                RoundedRectangle(cornerRadius: 50, style: .continuous)
                                .frame(width: geometry.size.width, height:geometry.size.height)
                            )
                            .padding(.horizontal, 40)
                        }
                    )
                }
                .padding(.horizontal, 30)
            }
        }.padding(.top,20)
    }
}

