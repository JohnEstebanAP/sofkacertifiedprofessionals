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
                HStack(){
                    Spacer()
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
                    Spacer().frame(width: 10)
                }
            }
        }
    }
}


#Preview {
    ImgPeopleAndService(image: "user1", listCertified: [CloudService.amazonWebServices.rawValue, CloudService.microsoftAzure.rawValue])
}
