//
//  HeaderView.swift
//  Restaurent
//
//  Created by sathish s on 09/02/2021.
//
import SwiftUI
struct HeaderView : View {
    var body: some View{
        
        VStack{
            HStack {
                Button(action: {
                    print("Menu")
                }) {
                    HStack {
                        Image(systemName: "text.alignleft")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    .frame(width: 20, height: 20)
                    .padding()
                   
                }
                Spacer()
                
                //
                
                Button(action: {
                    print("Search")
                }) {
                    HStack {
                        Image("shopping_cart")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .font(.title)
                            .foregroundColor(.black)
                        
                    }
                    
                    .frame(height:5)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.white)
                    .cornerRadius(40)
                    .padding(.trailing, 10)
                    .shadow(color: Color.black.opacity(0.05), radius: 5, x: 6, y: 6)
                }
            }
        }
    }
}
