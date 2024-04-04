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
    var city: String
    var country: String
    var yearsExperience: Int
    var languaje: [Languaje]
    var description: String
    
    init(id: String, name: String, lasName: String, area: String, img: String, certified: [String], city: String, country: String, yearsExperience: Int, languaje: [Languaje], description: String) {
        self.id = id
        self.name = name
        self.lasName = lasName
        self.area = area
        self.img = img
        self.certified = certified
        self.city = city
        self.country = country
        self.yearsExperience = yearsExperience
        self.languaje = languaje
        self.description = description
    }
}
