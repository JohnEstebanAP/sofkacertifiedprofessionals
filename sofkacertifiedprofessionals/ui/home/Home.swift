//
//  ContentView.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 1/04/24.
//

import SwiftUI

struct Home: View {
    @StateObject var viewModel = ViewModelHome()
    var listCloudServices: [CloudService] = CloudService.allList
    var onMenuItemSelected: (Int) -> Void
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
            VStack{
                Spacer()
                Text("Catálogo de nuestros profesionales certificados").fontWeight(.bold).font(.system(size: 20)).padding(.top, 14).padding(.horizontal, 8)
                Text("Encuentra nuestros profesionales de Sofka certificados en Microsoft Azure, Amazon Web Services (AWS) y Google Cloud Platform (GCP).")
                    .font(.system(size: 11)).padding(.vertical,14).padding(.horizontal, 8)
                Image("img_home").resizable().frame(width: 268, height: 228)
                Spacer()
            }
            
            
            VStack(alignment: .leading){
                ForEach(0..<listCloudServices.count){ index in
                    let countCertifiers = viewModel.countCertifiedCloud(index: index)
                    
                    
                    Button(action: {
                        
                    }) {
                        ZStack{
                            HStack{
                                
                            }      .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading).background(Color(red: 5/255, green: 6/255, blue: 47/255))}
                            HStack{
                                Text(listCloudServices[index].rawValue)
                                    .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255))
                                    .padding(.vertical,10)
                                    .padding(.horizontal,15)
                                Spacer()
                                Text("\(countCertifiers)")
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(
                                GeometryReader{
                                    geometry in
                                    LinearGradient(gradient: Gradient(colors: gradientColors(count: countCertifiers)), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/)
                                        .frame(width: geometry.size.width * 0.8, height: geometry.size.height)
                                        .mask(
                                            RoundedRectangle(cornerRadius: 50, style: .continuous)
                                                .frame(width: geometry.size.width, height: geometry.size.height)
                                        )
                                }
                            )     .padding(.horizontal, 30)
                                .shadow(color: .black, radius: 5, x: 0, y: 5)
                         
                        
                    }
                }
            }
            
            
            ZStack{
                Color(red: 230/255, green: 230/255, blue: 230/255)
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer()
                    Button(action: {
                        onMenuItemSelected(1)
                    }) {
                        Text("Encontrar Sofkianos")
                            .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255))
                            .padding()
                            .background(Color.black)
                            .cornerRadius(8)
                    }.padding()
                    Spacer()
                }
            }.frame(height: 84)
        }
    }
}

func gradientColors(count: Int) -> [Color] {
    let count1 = CGFloat(count)
    let orangeColor = Color(red: 1.0 - count1/10.0, green: 0.5, blue: 0.0) // Adjust hue based on text count
    let darkOrangeColor = Color(red: 0.7 - count1/20.0, green: 0.3, blue: 0.0) // Adjust hue based on text count
    return [orangeColor, darkOrangeColor]
}
