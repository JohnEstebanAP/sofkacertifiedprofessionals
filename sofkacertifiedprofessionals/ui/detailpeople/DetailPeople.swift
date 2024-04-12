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
                    
                    Text("\(people?.name ?? "") \(people?.lasName ?? "")").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).padding(.vertical,10).foregroundColor(.black)
                    
                    ForEach(people?.certified ?? [], id: \.count){ certified in
                        Text(certified).foregroundColor(Color(red: 5/255, green: 7/255, blue: 150/255))
                    }
                    
                    Text("\(people?.timeExperience ?? 0) meses de experiencia")
                        .padding(.top,2).foregroundColor(.black)
                    Text("___________________________________").foregroundColor(.black)
                    Text("Biografía").fontWeight(.bold).padding(.bottom,5).foregroundColor(.black)
                    
                    Text(people?.description ?? "").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                    
                    
                    Text("Lenguajes").fontWeight(.bold)
                        .padding(.top,10).foregroundColor(.black)
                    
                    if let languages = people?.languaje {
                        ForEach(0..<languages.count, id: \.self) { index in
                            Text("\(languages[index].languaje): \(languages[index].languajeLevel)")
                                .foregroundColor(.black)
                        }
                    }
                    
                    
                    
                    Text("Area").fontWeight(.bold)
                        .padding(.top,10).foregroundColor(.black)
                    Text(people?.area ?? "").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/).foregroundColor(Color(red: 102/255, green: 102/255, blue: 102/255))
                    
                    Text("\(people?.city ?? ""), \(people?.country ?? "")").padding(.vertical, 10).foregroundColor(.black)
                    
                    HStack{
                        Link(destination: URL(string: "https://wesofka.gointegro.com/gosocial/company/stream")!, label: {
                            VStack{
                                Image("logo_wesofka").resizable().scaledToFit().frame(width: 100, height: 50)
                                Text("WeSofka")
                            }
                        })
                        Link(destination: URL(string: "https://docs.google.com/presentation/d/1S12IvOV9QJ-VP3QkQdQcOF9UBwj6ozHMJ4dlaY3TZWY/edit#slide=id.p1")!, label: {
                            VStack{
                                Image("logo_cv").resizable().scaledToFit().frame(width: 50, height: 50)
                                Text("CV")
                            }
                        })
                    }
                    
                    CustomSlider(listimg: people?.certifiedImg ?? [])
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
