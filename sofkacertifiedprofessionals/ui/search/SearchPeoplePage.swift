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
    
    @State private var selectedButtonIndexCloud: Int = 0
    @State private var selectedButtonIndexArea: Int = 0
    @State private var listFilterPeoples: [Sofkiano] = []
    var filterService: Int?
    var listCloudServices: [String] = CloudService.allList
    var listAreaService: [String] = AreaService.allList
    
    var body: some View {
        VStack(alignment: .leading){
            ListFilterServices(title: "Tecnology:" ,selectedButtonIndex: $selectedButtonIndexCloud, listItems: listCloudServices)
            ListFilterServices(title: "CoE:" ,selectedButtonIndex: $selectedButtonIndexArea, listItems: listAreaService)
            ListViewDetailSofkianos(listSofkianos: listFilterPeoples)
            Spacer()
            
        }
        .background(
            Color(red:16/255,green:8/255,blue:19/255)
        )
        .onAppear{
            if(filterService != nil){
                selectedButtonIndexCloud = filterService ?? 0
            }
            listFilterPeoples = viewModel.listAllSofkianos()}
        .onChange(of: selectedButtonIndexCloud) { index in
            listFilterPeoples = viewModel.filterByCertified(index: index, areaIndex: selectedButtonIndexArea)
        }
        .onChange(of: selectedButtonIndexArea) { index in
            listFilterPeoples = viewModel.filterByArea(index: index, indexCertified: selectedButtonIndexCloud)
        }
    }
}

struct ListFilterServices : View {
    
    let title: String
    @Binding var selectedButtonIndex: Int
    var listItems: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack() {
                Text(title).foregroundColor(.white).fontWeight(.bold).padding(.horizontal,10)
                ForEach(listItems, id: \.self) { item in
                    Button(action: {
                        if let index = listItems.firstIndex(of: item) {
                            selectedButtonIndex = index
                        }
                    }) {
                        Text(item)
                            .foregroundColor(Color(red: 230/255, green: 230/255, blue: 230/255))
                            .padding(.vertical, 10)
                            .padding(.horizontal, 10)
                            .background(
                                RoundedRectangle(cornerRadius: 50)
                                    .fill(selectedButtonIndex == listItems.firstIndex(of: item) ? Color.orange : Color.black)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 50)
                                            .stroke(Color.white, lineWidth: 2)
                                    )
                            )
                    }
                }
            }.padding(.horizontal,10)
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
                            
                            Text("\(sofkiano.name) \(sofkiano.lasName)").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).font(.system(size: 20)).foregroundColor(.black)
                            ForEach(sofkiano.certified, id: \.count){ certified in
                                Text(certified).foregroundColor(Color(red: 5/255, green: 7/255, blue: 150/255))
                            }
                            Text(sofkiano.area).fontWeight(.light).font(.system(size: 15)).foregroundColor(.black)
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
