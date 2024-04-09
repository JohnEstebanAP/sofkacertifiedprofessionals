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
    @State var navigationInProgress: Bool = false
    var onShowingSearchable: () -> Void
    @State private var seletion: String?
    @State var listSofkianos: [Sofkiano] = []
    
    var body: some View {
        NavigationView{
            VStack{
                List(){
                    ForEach(listSofkianos, id: \.id){ sofkiano in
                        NavigationLink(
                            destination: DetailPeople(id: sofkiano.id),
                            tag: sofkiano.id,
                            selection: $seletion
                        ){
                            Text("\(sofkiano.name) \(sofkiano.lasName) ").foregroundColor(.black)
                        }
                        .tag(sofkiano.id)
                        .onTapGesture {
                            seletion = sofkiano.id
                            navigationInProgress = true
                        }
                        .onAppear(){
                            navigationInProgress = false
                            isPresente = true
                        }
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
            }
        }
        .foregroundColor(.white)
    }
}

