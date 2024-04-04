//
//  SearchablePeople.swift
//  sofkacertifiedprofessionals
//
//  Created by John Esteban Alvarez Piedrahita on 3/04/24.
//

import SwiftUI
import Foundation

struct SearchablePeople: View {
    @StateObject var viewModel = ViewModelHome()
    @State private var searchableText: String = ""
    @State private var isPresente: Bool = true
    var onShowingSearchable: () -> Void
    
    var listSofkianos: [Sofkiano]{
        return viewModel.updatelistFilter(searchableText: searchableText)
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    ForEach(listSofkianos, id: \.id){sofkiano in
                        Text("\(sofkiano.name) \(sofkiano.lasName) ").foregroundColor(.black)
                    }
                }
            }
        }
        .searchable(text: $searchableText, isPresented: $isPresente, placement: SearchFieldPlacement.toolbar,
                    prompt: Text("Buscar Sofkiano")
        )
        .onChange(of: isPresente, initial: true) { _, isActiveSearchable in
            if !isActiveSearchable {
                onShowingSearchable()
            }
        }
        .foregroundColor(.white)
    }
}

