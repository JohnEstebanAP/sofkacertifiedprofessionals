//
//  ImgPeopleAndService.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 4/04/24.
//

import SwiftUI

struct ImgPeopleAndService: View {
    var image: String
    var listCertified: [String]
    
    var body: some View {
        ZStack{
            Image(image).resizable().scaledToFit()
            VStack{
                Spacer()
                HStack(alignment: .bottom){
                    Spacer()
                    if (listCertified.count >= 3){
                        ForEach(0..<3){ index in
                            Image(
                                listCertified[index] == CloudService.amazonWebServices.rawValue
                                ? "logo_aws"
                                : listCertified[index] == CloudService.microsoftAzure.rawValue
                                ?"logo_azure"
                                :"logo_google_cloud"
                            ).resizable().scaledToFit()
                                .padding(.bottom, 10)
                                .frame(width: 70)
                        }
                        
                        HStack{
                            Circle()
                                .foregroundColor(.red)
                                .frame(width: 10)
                            Circle()
                                .foregroundColor(.green)
                                .frame(width: 10)
                            Circle()
                                .foregroundColor(.blue)
                                .frame(width: 10)
                        }  .padding(.bottom, 10)
                        
                        
                    }else{
                        ForEach(listCertified, id: \.count){certified in
                            Image(
                                certified == CloudService.amazonWebServices.rawValue
                                ? "logo_aws"
                                : certified == CloudService.microsoftAzure.rawValue
                                ?"logo_azure"
                                :"logo_google_cloud"
                            ).resizable().scaledToFit()
                                .padding(.bottom, 10)
                                .frame(width: 70)
                        }
                        
                    }
                    Spacer().frame(width: 10)
                }
            }
        }
    }
}


#Preview {
    ImgPeopleAndService(image: "user1", listCertified: [CloudService.amazonWebServices.rawValue, CloudService.microsoftAzure.rawValue])
}
