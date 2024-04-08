//
//  CloudService.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 3/04/24.
//

import Foundation

enum CloudService: String, CaseIterable {
    case todos = "Todos"
    case microsoftAzure = "Microsoft Azure"
    case amazonWebServices = "Amazon Web Services (AWS)"
    case googleCloudPlatform = "Google Cloud Platform (GCP)"
    case scrum = "Scrum"
    case rpa = "RPA"
    case istqb = "ISTQB"
    case mongo = "Mongo"
    
    
    static var allList: [String] {
        var services: [String] = []
        for service in CloudService.allCases {
            services.append(service.rawValue)
            
        }
        return services
    }
    
    static var allServices: [String] {
        var services: [String] = []
        for service in CloudService.allCases {
            if(service != CloudService.todos){
                services.append(service.rawValue)
            }
        }
        return services
    }
    
}

