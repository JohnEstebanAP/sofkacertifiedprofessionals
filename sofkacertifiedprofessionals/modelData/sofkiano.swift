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
    
    init(id: String, name: String, lasName: String, area: String, img: String, certified: [String]) {
        self.id = id
        self.name = name
        self.lasName = lasName
        self.area = area
        self.img = img
        self.certified = certified
    }
}
