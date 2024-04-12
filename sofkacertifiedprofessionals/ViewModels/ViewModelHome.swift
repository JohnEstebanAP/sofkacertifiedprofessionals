//
//  ViewModelHome.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 3/04/24.
//

import Foundation

enum ImgCetified:  String, CaseIterable{
    case certifiedAzure = "https://1.bp.blogspot.com/-2sK67pmrfVA/XG5_ZTw6yOI/AAAAAAAAEqI/zSNFXIV8Kyc4_bK5YzSIWh3DtFDl06MpACLcBGAs/s1600/Microsoft%2BCertified%2BAzure%2BAdministrator%2BAssociate.png"
    case certifiedGoogle = "https://miro.medium.com/v2/resize:fit:1400/format:webp/1*rZrcQdtv9UiYqAbwWujpHw.png"
    
    case certifiedAWS = "https://www.javierrguez.com/wp-content/uploads/aws-cloud-practitioner-certificate.png"
}

class ViewModelHome: ObservableObject{
    
    private var listSofkianos: [Sofkiano] = Sofkiano.allListDemo
    
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
