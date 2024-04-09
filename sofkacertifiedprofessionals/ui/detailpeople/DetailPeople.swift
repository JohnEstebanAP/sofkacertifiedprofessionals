//
//  DetailPeople.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 4/04/24.
//

import SwiftUI

struct DetailPeople: View {
    
    @StateObject var viewModel = ViewModelHome()
    
    var idPeople: String
    
    var people: Sofkiano?
    
    init(id: String ){
        self.idPeople = id
        self.people = self.viewModel.findPeopleID(idPeople: id)
    }
    
    var body: some View {
        if(people?.id == nil){
            VStack{
                Image("logo_sofka").resizable().scaledToFit()
            }
        }else{
            
            ScrollView{
                VStack (alignment: .leading){
                    ImgPeopleAndService(image: people?.img ?? "logo_sofka", listCertified: people?.certified ?? [] ).cornerRadius(20)
        
                    Text("\(people?.name ?? "") \(people?.lasName ?? "")").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical,10)
                    
                    ForEach(people?.certified ?? [], id: \.count){ certified in
                        Text(certified).foregroundColor(Color(red: 5/255, green: 7/255, blue: 150/255))
                    }
                    
                    Text("\(people?.TimeExperience ?? 0) años de experiencia")
                        .padding(.top,2)
                    Text("___________________________________")
                    Text("Biografía").fontWeight(.bold).padding(.bottom,5)
                 
                    Text(people?.description ?? "").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                    
                    Text("Lenguajes").fontWeight(.bold)
                        .padding(.top,10)
                    HStack{
                        ForEach(people?.languaje ?? [], id: \.self){ languaje in
                            Text("\(languaje.rawValue),")
                        }
                    }
                    
                    
                    Text("Area").fontWeight(.bold)
                        .padding(.top,10)
                    Text(people?.area ?? "").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                    
                    Text("\(people?.city ?? ""), \(people?.country ?? "")").padding(.vertical, 10)
               
                    CustomSlider(listimg: people?.certified ?? [])
                }
                .padding(.horizontal,20)
                .padding()
            }
        }
    }
}

#Preview {
    DetailPeople(id: "1")
}
