//
//  SearchPeoplePage.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 2/04/24.
//

import SwiftUI
import Combine
struct SearchPeoplePage:View {
    
    @StateObject var viewModel = ViewModelHome()
    
    @State private var selectedButtonIndex: Int = 0
    @State private var listFilterPeoples: [Sofkiano] = []
    
    var listCloudServices: [CloudService] = CloudService.allList
    
    var body: some View {
        VStack(alignment: .leading){
            ListFilterServices(selectedButtonIndex: $selectedButtonIndex, listCloudServices: listCloudServices)
            ListViewDetailSofkianos(listSofkianos: listFilterPeoples)
        }
        .background(Color(red:16/255,green:8/255,blue:19/255))
        .onAppear{ listFilterPeoples = viewModel.listAllSofkianos()}//esta kinea de codigo genera problemas en la previsulisacion pero no en el codigo
        .onChange(of: selectedButtonIndex) { index in
            listFilterPeoples = (index == 0)
            ?  viewModel.listAllSofkianos()
            :  viewModel.listAllSofkianos().filter { sofks in
                sofks.certified.contains(
                    (index == 1)
                    ? CloudService.microsoftAzure.rawValue
                    : (index == 2)
                    ? CloudService.amazonWebServices.rawValue
                    : CloudService.googleCloudPlatform.rawValue
                )
            }
        }
    }
}

struct ListFilterServices : View {
    
    @Binding var selectedButtonIndex: Int
    var listCloudServices: [CloudService]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack{
                ForEach(0..<listCloudServices.count){ index in
                    Button(action: {
                        selectedButtonIndex = index
                    }) {
                        Text(listCloudServices[index].rawValue)
                            .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255))
                            .padding(.vertical,10)
                            .padding(.horizontal,15)
                            .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .fill(selectedButtonIndex == index ? Color.orange : Color.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            )
                        
                    }.padding(.top, 20)
                        .padding(.bottom,20)
                        .padding(.horizontal,5)
                }
            }
        }
    }
}

struct ListViewDetailSofkianos: View {
    var listSofkianos: [Sofkiano]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                ForEach(listSofkianos, id: \.id){sofkiano in
                    NavigationLink(destination:  DetailPeople(id: sofkiano.id)){
                        VStack{
                            ImgPeopleAndService(image: sofkiano.img, listCertified: sofkiano.certified)
                            
                            Text("\(sofkiano.name) \(sofkiano.lasName)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 20))
                            ForEach(sofkiano.certified, id: \.count){ certified in
                                Text(certified).foregroundColor(Color(red: 5/255, green: 7/255, blue: 150/255))
                            }
                            Text(sofkiano.area).fontWeight(.light).font(.system(size: 15))
                        }
                        .background(.white.opacity(0.9))
                        .cornerRadius(20)
                    .padding()
                    }
                }
            }.padding(.horizontal)
        }
    }
}

#Preview {
    SearchPeoplePage()
}
