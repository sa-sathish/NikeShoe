//
//  SearchView.swift
//  Restaurent
//
//  Created by sathish s on 09/02/2021.
//

import SwiftUI


struct SearchView: View {
    
    @State var searchedText: String = ""
    var body: some View {
        VStack(alignment: .leading,spacing: 10){
            HStack {
                
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search shoes", text: $searchedText).foregroundColor(Color.gray)
                }
                .padding()
                
                .frame(height: 50)
                
                .background(Color.white)

            .cornerRadius(40)

            }
            .padding(.top,0)
           
        }
        .padding()
        .frame(height: 70, alignment: .center)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 6, y: 6)
        
    }
}
