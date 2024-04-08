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
    @State private var navigationInProgress: Bool = false
    var onShowingSearchable: () -> Void
    
    @State var listSofkianos: [Sofkiano] = []
    
    var body: some View {
        NavigationView{
            VStack{
                List(listSofkianos, id: \.id){ sofkiano in
                        NavigationLink(
                           destination: DetailPeople(id: sofkiano.id)){
                            Text("\(sofkiano.name) \(sofkiano.lasName) ").foregroundColor(.black)
                       }  .onAppear {
                           navigationInProgress = true // Navegación iniciada
                       }
                       .onDisappear {
                           navigationInProgress = false // Navegación finalizada
                       }
                }
            }
        }
        .searchable(text: $searchableText, isPresented: $isPresente, placement: SearchFieldPlacement.toolbar,
                    prompt: Text("Buscar Sofkiano")
        )
        .onChange(of: searchableText, initial: true){
            listSofkianos = viewModel.updatelistFilter(searchableText: searchableText)
        }
        .onChange(of: isPresente, initial: true) { _, isActiveSearchable in
            if !isActiveSearchable && !navigationInProgress {
                onShowingSearchable()
            }else{
                isPresente = true
            }
        }
        .foregroundColor(.white)
    }
}

