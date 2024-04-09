//
//  ViewModelHome.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 3/04/24.
//

import Foundation

class ViewModelHome: ObservableObject{
    private var listSofkianos: [Sofkiano] = [
        Sofkiano(id:"1", name: "Jenni Fernanda", lasName: "Ruiz", area: AreaService.rpa.rawValue, img: "user1", certified: [CloudService.microsoftAzure.rawValue], city: "Pereira", country: "Colombia", yearsExperience: 5, languaje: [Languaje.español, Languaje.inges], description: "Jenni Fernanda Ruiz es una senior en desarrollo de software y especialista en desarrollo en la nube en Pereira, Colombia. Le encanta compartir sus conocimientos y ponerse a prueba. Especialista en Microsoft Azure y soluciones en la nube. "  ),
        
        Sofkiano(id:"2", name: "Jazmin", lasName: "Cañas", area: AreaService.qa.rawValue, img: "user2", certified: [CloudService.amazonWebServices.rawValue, CloudService.googleCloudPlatform.rawValue], city: "Bogotá", country: "Colombia", yearsExperience: 3, languaje: [Languaje.español, Languaje.inges, Languaje.Portugues ], description: "Jazmin Cañas es un senior en desarrollo de software y especialista en desarrollo en la nube en Bogotá, Colombia. Experiencia en diseños de arquitectura y despliegues en la nube."),
        
        Sofkiano(id:"3", name: "Leonardo", lasName: "Arias", area: AreaService.management.rawValue, img: "user3", certified: [CloudService.amazonWebServices.rawValue], city: "Cali", country: "Colombia", yearsExperience: 6, languaje: [Languaje.español, Languaje.inges, Languaje.mandarin], description:"Leonardo Arias es un senior en desarrollo de software y especialista en desarrollo de datos y en la nube en Santander, Colombia. Le encanta enfrentar retos nuevos. Sus proyectos están orientados a ayudar a las personas a través de las tecnología en la nube."),
        
        Sofkiano(id:"4", name: "Fernanda", lasName: "Botero", area: AreaService.desarrolloArquitectura.rawValue, img: "user4", certified: [CloudService.googleCloudPlatform.rawValue, CloudService.microsoftAzure.rawValue], city: "Cartagena", country: "Colombia", yearsExperience: 6, languaje: [Languaje.español, Languaje.inges], description: "Fernanda Botero es un senior en desarrollo de software y especialista en desarrollo web y en la nube en Cartagena, Colombia. Le encanta enfrentar retos nuevos y aportar su experticia en todo el ecosistema de Google Cloud."),
        
        Sofkiano(id:"5", name: "Maria", lasName: "Arboleda", area: AreaService.bi_ia.rawValue, img: "user5", certified: [CloudService.googleCloudPlatform.rawValue], city: "Medellín", country: "Colombia", yearsExperience: 7, languaje: [Languaje.español, Languaje.inges, Languaje.frances], description: "Maria Arboleda es un senior en desarrollo de software y especialista en desarrollo en la nube en Medellín, Colombia. Sus proyectos están enfocados en brindar soluciones a las personas a través de la plataforma de Google Cloud."),
        
        Sofkiano(id:"6", name: "Adrian", lasName: "Perez", area: AreaService.Cloud.rawValue, img: "user6", certified: CloudService.allServices, city: "Santander", country: "Colombia", yearsExperience: 10, languaje: [Languaje.español, Languaje.inges], description: "Adrian Perez es un senior en desarrollo de software y especialista en desarrollo de datos en Santander, Colombia. Le encanta enfrentar retos nuevos y compartir su conocimiento de desarrollo en la nube con sus compañeros. Sus proyectos han recibido varias nominaciones n importantes organizaciones y todos estos están orientados a ayudar a las personas a través de las tecnología en la nube. " ),
        
        Sofkiano(id:"7", name: "Jenni Fernanda", lasName: "Ruiz", area: AreaService.Cloud.rawValue, img: "user1", certified: [CloudService.microsoftAzure.rawValue], city: "Pereira", country: "Colombia", yearsExperience: 5, languaje: [Languaje.español, Languaje.inges], description: "Jenni Fernanda Ruiz es una senior en desarrollo de software y especialista en desarrollo en la nube en Pereira, Colombia. Le encanta compartir sus conocimientos y ponerse a prueba. Especialista en Microsoft Azure y soluciones en la nube. "  ),

        Sofkiano(id:"8", name: "Jazmin", lasName: "Cañas", area: AreaService.bi_ia.rawValue, img: "user2", certified: [CloudService.amazonWebServices.rawValue, CloudService.googleCloudPlatform.rawValue], city: "Bogotá", country: "Colombia", yearsExperience: 3, languaje: [Languaje.español, Languaje.inges, Languaje.Portugues ], description: "Jazmin Cañas es un senior en desarrollo de software y especialista en desarrollo en la nube en Bogotá, Colombia. Experiencia en diseños de arquitectura y despliegues en la nube."),

        Sofkiano(id:"9", name: "Leonardo", lasName: "Arias", area: AreaService.desarrolloArquitectura.rawValue, img: "user3", certified: [CloudService.amazonWebServices.rawValue], city: "Cali", country: "Colombia", yearsExperience: 6, languaje: [Languaje.español, Languaje.inges, Languaje.mandarin], description:"Leonardo Arias es un senior en desarrollo de software y especialista en desarrollo de datos y en la nube en Santander, Colombia. Le encanta enfrentar retos nuevos. Sus proyectos están orientados a ayudar a las personas a través de las tecnología en la nube."),

        Sofkiano(id:"10", name: "Fernanda", lasName: "Botero", area: AreaService.management.rawValue, img: "user4", certified: [CloudService.googleCloudPlatform.rawValue, CloudService.microsoftAzure.rawValue], city: "Cartagena", country: "Colombia", yearsExperience: 6, languaje: [Languaje.español, Languaje.inges], description: "Fernanda Botero es un senior en desarrollo de software y especialista en desarrollo web y en la nube en Cartagena, Colombia. Le encanta enfrentar retos nuevos y aportar su experticia en todo el ecosistema de Google Cloud."),

        Sofkiano(id:"11", name: "Maria", lasName: "Arboleda", area: AreaService.qa.rawValue, img: "user5", certified: [CloudService.googleCloudPlatform.rawValue], city: "Medellín", country: "Colombia", yearsExperience: 7, languaje: [Languaje.español, Languaje.inges, Languaje.frances], description: "Maria Arboleda es un senior en desarrollo de software y especialista en desarrollo en la nube en Medellín, Colombia. Sus proyectos están enfocados en brindar soluciones a las personas a través de la plataforma de Google Cloud."),

        Sofkiano(id:"12", name: "Adrian", lasName: "Perez", area: AreaService.rpa.rawValue, img: "user6", certified: CloudService.allServices, city: "Santander", country: "Colombia", yearsExperience: 10, languaje: [Languaje.español, Languaje.inges], description: "Adrian Perez es un senior en desarrollo de software y especialista en desarrollo de datos en Santander, Colombia. Le encanta enfrentar retos nuevos y compartir su conocimiento de desarrollo en la nube con sus compañeros. Sus proyectos han recibido varias nominaciones n importantes organizaciones y todos estos están orientados a ayudar a las personas a través de las tecnología en la nube. " )
    ]
    
    init(){
    }
    
    func listAllSofkianos()-> [Sofkiano]{
        return listSofkianos
    }
    
    @MainActor
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
    
    @MainActor
    func findPeopleID(idPeople: String)-> Sofkiano?{
        listSofkianos.filter{ sokiano in
            return sokiano.id.contains(idPeople)
        }.first
    }
    
    func countCertifiedCloud(index: Int)-> Int{
        
        if(index == 0){
            return listSofkianos.count
        }
        
        return listSofkianos.filter{ sofkiano in
            sofkiano.certified.contains(CloudService.allList[index])
        }.count
    }
    
    @MainActor
    func filterByCertified(index: Int, areaIndex: Int?)-> [Sofkiano]{

        if(areaIndex != nil){
            return filterByArea(index: areaIndex ?? 0, indexCertified: index)
        }else{
            return (index == 0)
            ?  listAllSofkianos()
            :  listAllSofkianos().filter { sofkiano in
                sofkiano.certified.contains(
                    (index == 1)
                    ? CloudService.microsoftAzure.rawValue
                    : (index == 2)
                    ? CloudService.amazonWebServices.rawValue
                    : (index == 3)
                    ? CloudService.googleCloudPlatform.rawValue
                    : (index == 4)
                    ? CloudService.scrum.rawValue
                    : (index == 5)
                    ? CloudService.rpa.rawValue
                    : (index == 6)
                    ? CloudService.istqb.rawValue
                    : CloudService.mongo.rawValue
                )
            }
        }
    }
    
    @MainActor
    func filterByArea(index: Int, indexCertified: Int) -> [Sofkiano]{
        
        let listFilterPeoples = filterByCertified(index: indexCertified, areaIndex: nil)
        
        var newList: [Sofkiano] = []
        switch index{
        case 0:
            newList = listFilterPeoples
        case 1:
            newList = listFilterPeoples.filter { sofkiano in
                sofkiano.area == AreaService.desarrolloArquitectura.rawValue
            }
        case 2:
            newList = listFilterPeoples.filter { sofkiano in
                sofkiano.area == AreaService.management.rawValue
            }
            
        case 3:
            newList = listFilterPeoples.filter { sofkiano in
                sofkiano.area == AreaService.Cloud.rawValue
            }
            
        case 4:
            newList = listFilterPeoples.filter { sofkiano in
                sofkiano.area == AreaService.rpa.rawValue
            }
            
        case 5:
            newList = listFilterPeoples.filter { sofkiano in
                sofkiano.area == AreaService.qa.rawValue
            }
            
        case 6:
            newList = listFilterPeoples.filter { sofkiano in
                sofkiano.area ==  AreaService.bi_ia.rawValue
            }
        default:
            newList = []
        }
        return newList
    }
}
