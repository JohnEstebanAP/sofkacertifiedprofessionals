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
    var languaje: [Languaje?]?
    var levelLanguaje: String?
    var description: String
    var weSofkaLink: String?
    var CvSofkaLink: String?
    
    init(id: String, name: String, lasName: String, area: String, img: String, certified: [String], certifiedImg: [String?]?, city: String, country: String, timeExperience: Int, languaje: [Languaje], levelLanguaje: String?, description: String, weSofkaLink: String?, CvSofkaLink: String?) {
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
        if(levelLanguaje != nil){
            self.levelLanguaje = levelLanguaje
        }
        self.description = description
        if(weSofkaLink != nil){
            self.weSofkaLink = weSofkaLink!
        }
        if(CvSofkaLink != nil){
            self.CvSofkaLink = CvSofkaLink
        }
    }
}
