//
//  AreaService.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 8/04/24.
//

import Foundation

import Foundation

enum AreaService: String, CaseIterable {
    case todos = "Todos"
    case desarrolloArquitectura = "Desarrollo y Arquitectura"
    case management = "Management"
    case Cloud = "Cloud"
    case rpa = "RPA"
    case qa = "QA"
    case bi_ia = "BI/IA"
    
    
    static var allList: [String] {
        var services: [String] = []
        for service in AreaService.allCases {
                services.append(service.rawValue)
        }
        return services
    }

    static var allServices: [String] {
        var services: [String] = []
        for service in AreaService.allCases {
            if(service != AreaService.todos){
                services.append(service.rawValue)
            }
        }
        return services
    }
}

