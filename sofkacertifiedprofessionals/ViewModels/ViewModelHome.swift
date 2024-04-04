//
//  ViewModelHome.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 3/04/24.
//

import Foundation

class ViewModelHome: ObservableObject{
    private var listSofkianos: [Sofkiano] = [
        Sofkiano(id:"1", name: "Jenni Fernanda", lasName: "Ruiz", area: "CoE DevOps", img: "user1", certified: [CloudService.microsoftAzure.rawValue]),
        Sofkiano(id:"2", name: "Jazmin", lasName: "Cañas", area: "CoE DevSps", img: "user2", certified: [CloudService.amazonWebServices.rawValue, CloudService.googleCloudPlatform.rawValue]),
        Sofkiano(id:"3", name: "Leonardo", lasName: "Arias", area: "CoE DevOps", img: "user3", certified: [CloudService.amazonWebServices.rawValue]),
        Sofkiano(id:"4", name: "Fernanda", lasName: "Botero", area: "CoE DevOps", img: "user4", certified: [CloudService.googleCloudPlatform.rawValue, CloudService.microsoftAzure.rawValue]),
        Sofkiano(id:"5", name: "Maria", lasName: "Arboleda", area: "CoE DevOps", img: "user5", certified: [CloudService.googleCloudPlatform.rawValue]),
        Sofkiano(id:"6", name: "Adrian", lasName: "Perez", area: "CoE DevOps", img: "user6", certified: CloudService.allServices)
    ]
    
    init(){
    }
    
    func listAllSofkianos()-> [Sofkiano]{
        return listSofkianos
    }
    
    func updatelistFilter(searchableText: String)-> [Sofkiano]{
        if searchableText.isEmpty{
            return listSofkianos
        }else{
            return listSofkianos.filter{
                sofkiano in
                return (sofkiano.name.uppercased().contains(searchableText.uppercased())
                        || sofkiano.lasName.uppercased().contains(searchableText.uppercased())
                )
            }
        }
    }
}
