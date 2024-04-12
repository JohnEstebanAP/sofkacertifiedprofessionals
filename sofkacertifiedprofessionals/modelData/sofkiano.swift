//
//  sofkiano.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 3/04/24.
//

import Foundation

class Sofkiano {
    var id: String
    var name: String
    var lasName: String
    var area: String
    var img: String
    var certified: [String]
    var certifiedImg: [String?]?
    var city: String
    var country: String
    var timeExperience: Int
    var languaje: [Languaje]
    var description: String
    var weSofkaLink: String?
    var CvSofkaLink: String?
    
    static let allListDemo =  [
        Sofkiano(
            id:"1",
            name: "Jenni Fernanda",
            lasName: "Ruiz",
            area: AreaService.rpa.rawValue,
            img: "user1",
            certified: [CloudService.microsoftAzure.rawValue],
            certifiedImg: [ImgCetified.certifiedAzure.rawValue ],
            city: "Pereira",
            country: "Colombia",
            timeExperience: 5,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue)
            ],
            description: "Jenni Fernanda Ruiz es una senior en desarrollo de software y especialista en desarrollo en la nube en Pereira, Colombia. Le encanta compartir sus conocimientos y ponerse a prueba. Especialista en Microsoft Azure y soluciones en la nube. ",
            weSofkaLink: nil,
            CvSofkaLink: nil),
        
        Sofkiano(
            id:"2",
            name: "Jazmin",
            lasName: "Cañas",
            area: AreaService.qa.rawValue,
            img: "user2",
            certified: [CloudService.amazonWebServices.rawValue, CloudService.googleCloudPlatform.rawValue],
            certifiedImg: [ImgCetified.certifiedGoogle.rawValue],
            city: "Bogotá",
            country: "Colombia",
            timeExperience: 3,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Jazmin Cañas es un senior en desarrollo de software y especialista en desarrollo en la nube en Bogotá, Colombia. Experiencia en diseños de arquitectura y despliegues en la nube.",
            weSofkaLink: nil,
            CvSofkaLink: nil),
        
        Sofkiano(
            id:"3",
            name: "Leonardo",
            lasName: "Arias",
            area: AreaService.management.rawValue,
            img: "user3",
            certified: [CloudService.amazonWebServices.rawValue],
            certifiedImg: [ImgCetified.certifiedAWS.rawValue],
            city: "Cali",
            country: "Colombia",
            timeExperience: 6,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description:"Leonardo Arias es un senior en desarrollo de software y especialista en desarrollo de datos y en la nube en Santander, Colombia. Le encanta enfrentar retos nuevos. Sus proyectos están orientados a ayudar a las personas a través de las tecnología en la nube.",
            weSofkaLink: nil,
            CvSofkaLink: nil),
        
        Sofkiano(
            id:"4",
            name: "Fernanda",
            lasName: "Botero",
            area: AreaService.desarrolloArquitectura.rawValue,
            img: "user4",
            certified: [CloudService.googleCloudPlatform.rawValue, CloudService.microsoftAzure.rawValue],
            certifiedImg: [ImgCetified.certifiedGoogle.rawValue, ImgCetified.certifiedAzure.rawValue],
            city: "Cartagena",
            country: "Colombia",
            timeExperience: 6,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Fernanda Botero es un senior en desarrollo de software y especialista en desarrollo web y en la nube en Cartagena, Colombia. Le encanta enfrentar retos nuevos y aportar su experticia en todo el ecosistema de Google Cloud.",
            weSofkaLink: nil,
            CvSofkaLink: nil),
        
        Sofkiano(
            id:"5",
            name: "Maria",
            lasName: "Arboleda",
            area: AreaService.bi_ia.rawValue,
            img: "user5",
            certified: [CloudService.googleCloudPlatform.rawValue],
            certifiedImg: [ImgCetified.certifiedGoogle.rawValue],
            city: "Medellín",
            country: "Colombia",
            timeExperience: 7,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Maria Arboleda es un senior en desarrollo de software y especialista en desarrollo en la nube en Medellín, Colombia. Sus proyectos están enfocados en brindar soluciones a las personas a través de la plataforma de Google Cloud.",
            weSofkaLink: nil,
            CvSofkaLink: nil),
        
        Sofkiano(
            id:"6",
            name: "Adrian",
            lasName: "Perez",
            area: AreaService.Cloud.rawValue,
            img: "user6",
            certified: CloudService.allServices,
            certifiedImg: [ImgCetified.certifiedAWS.rawValue, ImgCetified.certifiedAzure.rawValue, ImgCetified.certifiedGoogle.rawValue],
            city: "Santander",
            country: "Colombia",
            timeExperience: 10,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Adrian Perez es un senior en desarrollo de software y especialista en desarrollo de datos en Santander, Colombia. Le encanta enfrentar retos nuevos y compartir su conocimiento de desarrollo en la nube con sus compañeros. Sus proyectos han recibido varias nominaciones n importantes organizaciones y todos estos están orientados a ayudar a las personas a través de las tecnología en la nube. " ,
            weSofkaLink: nil,
            CvSofkaLink: nil ),
        
        Sofkiano(
            id:"7",
            name: "Jenni Fernanda",
            lasName: "Ruiz",
            area: AreaService.Cloud.rawValue,
            img: "user1",
            certified: [CloudService.microsoftAzure.rawValue],
            certifiedImg: [ImgCetified.certifiedAzure.rawValue],
            city: "Pereira",
            country: "Colombia",
            timeExperience: 5,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Jenni Fernanda Ruiz es una senior en desarrollo de software y especialista en desarrollo en la nube en Pereira, Colombia. Le encanta compartir sus conocimientos y ponerse a prueba. Especialista en Microsoft Azure y soluciones en la nube." ,
            weSofkaLink: nil,
            CvSofkaLink: nil ),

        Sofkiano(
            id:"8",
            name: "Jazmin",
            lasName: "Cañas",
            area: AreaService.bi_ia.rawValue,
            img: "user2",
            certified: [CloudService.amazonWebServices.rawValue, CloudService.googleCloudPlatform.rawValue],
            certifiedImg: [ImgCetified.certifiedAWS.rawValue, ImgCetified.certifiedGoogle.rawValue],
            city: "Bogotá",
            country: "Colombia",
            timeExperience: 3,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Jazmin Cañas es un senior en desarrollo de software y especialista en desarrollo en la nube en Bogotá, Colombia. Experiencia en diseños de arquitectura y despliegues en la nube.",
            weSofkaLink: nil,
            CvSofkaLink: nil),

        
        //falta por sertiicado
        Sofkiano(
            id:"9",
            name: "Leonardo",
            lasName: "Arias",
            area: AreaService.desarrolloArquitectura.rawValue,
            img: "user3",
            certified: [CloudService.amazonWebServices.rawValue],
            certifiedImg: nil,
            city: "Cali",
            country: "Colombia",
            timeExperience: 6,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description:"Leonardo Arias es un senior en desarrollo de software y especialista en desarrollo de datos y en la nube en Santander, Colombia. Le encanta enfrentar retos nuevos. Sus proyectos están orientados a ayudar a las personas a través de las tecnología en la nube.",
            weSofkaLink: nil,
            CvSofkaLink: nil),

        Sofkiano(
            id:"10",
            name: "Fernanda",
            lasName: "Botero",
            area: AreaService.management.rawValue,
            img: "user4",
            certified: [CloudService.googleCloudPlatform.rawValue, CloudService.microsoftAzure.rawValue],
            certifiedImg: nil,
            city: "Cartagena",
            country: "Colombia",
            timeExperience: 6,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Fernanda Botero es un senior en desarrollo de software y especialista en desarrollo web y en la nube en Cartagena, Colombia. Le encanta enfrentar retos nuevos y aportar su experticia en todo el ecosistema de Google Cloud.",
            weSofkaLink: nil,
            CvSofkaLink: nil),

        Sofkiano(
            id:"11",
            name: "Maria",
            lasName: "Arboleda",
            area: AreaService.qa.rawValue,
            img: "user5",
            certified: [CloudService.googleCloudPlatform.rawValue],
            certifiedImg: nil,
            city: "Medellín",
            country: "Colombia",
            timeExperience: 7,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Maria Arboleda es un senior en desarrollo de software y especialista en desarrollo en la nube en Medellín, Colombia. Sus proyectos están enfocados en brindar soluciones a las personas a través de la plataforma de Google Cloud.",
            weSofkaLink: nil,
            CvSofkaLink: nil),

        Sofkiano(
            id:"12",
            name: "Adrian",
            lasName: "Perez",
            area: AreaService.rpa.rawValue,
            img: "user6",
            certified: CloudService.allServices,
            certifiedImg: [ImgCetified.certifiedAWS.rawValue, ImgCetified.certifiedAzure.rawValue, ImgCetified.certifiedGoogle.rawValue],
            city: "Santander",
            country: "Colombia",
            timeExperience: 10,
            languaje: [
                Languaje(languaje: LanguajeEnum.español.rawValue,languajeLevel: LanguageLevelEnum.nativo.rawValue),
                Languaje(languaje: LanguajeEnum.Portugues.rawValue, languajeLevel: LanguageLevelEnum.medio.rawValue),
                Languaje(languaje: LanguajeEnum.inges.rawValue, languajeLevel: LanguageLevelEnum.basico.rawValue)
            ],
            description: "Adrian Perez es un senior en desarrollo de software y especialista en desarrollo de datos en Santander, Colombia. Le encanta enfrentar retos nuevos y compartir su conocimiento de desarrollo en la nube con sus compañeros. Sus proyectos han recibido varias nominaciones n importantes organizaciones y todos estos están orientados a ayudar a las personas a través de las tecnología en la nube. ",
            weSofkaLink: nil,
            CvSofkaLink: nil )
    ]

    init(id: String, name: String, lasName: String, area: String, img: String, certified: [String], certifiedImg: [String?]?, city: String, country: String, timeExperience: Int, languaje: [Languaje], description: String, weSofkaLink: String?, CvSofkaLink: String?) {
        self.id = id
        self.name = name
        self.lasName = lasName
        self.area = area
        self.img = img
        self.certified = certified
        if (certifiedImg != nil){
            self.certifiedImg = certifiedImg
        }
        self.city = city
        self.country = country
        self.timeExperience = timeExperience
        self.languaje = languaje
        self.description = description
        if(weSofkaLink != nil){
            self.weSofkaLink = weSofkaLink!
        }
        if(CvSofkaLink != nil){
            self.CvSofkaLink = CvSofkaLink
        }
    }
}
