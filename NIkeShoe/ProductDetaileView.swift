//
//  ProductDetaileView.swift
//  NIkeShoe
//
//  Created by sathish s on 19/04/2021.
//

import SwiftUI

struct ProductDetaileView: View {
    var product: Product
    var body: some View {
        AddToCart(product:product)
    }
}

struct AddToCart: View {
    var product: Product
    @State var more = false
    @State var selectedSize = 7
    @State var isAddedInCart = false
    @State var isAddedInWishList = false
    @State var selectedColor: Int = 0
    
    let black = Color.black.opacity(0.7)
    
    var body: some View {
        VStack {
            ZStack {
                HStack {
                   
                    Button(action: {}) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22))
                            .foregroundColor(Color(UIColor(named: product.imageName)!))
                            .frame(width: 40, height: 40)
                            .cornerRadius(4)
                    }
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        isAddedInWishList.toggle()
                    }) {
                        Image(systemName:!isAddedInWishList ? "heart" : "heart.fill")
                            .font(.system(size: 22))
                            .foregroundColor(Color(UIColor(named: product.imageName)!))
                            .frame(width: 40, height: 40)
                            .cornerRadius(4)
                    }
                }
            }
            .padding()
            
        
            
            Image(product.imageName)
                .resizable()
                .frame(width: 250, height: 250)

            
            
            VStack {
                
                VStack(alignment: .leading) {
                 
                    HStack {
                        Text(product.productDiscription)
                            .font(.system(size: 28, weight: .bold, design: .monospaced))
                            .foregroundColor(Color(UIColor(named: product.imageName)!))
                        
                        Text(product.productDiscription)
                            .strikethrough()
                            .font(.system(size: 15, weight: .bold, design: .monospaced))
                            .foregroundColor(Color.gray)
                            .padding(.top, 10)
                                                
                    }
                    Text(product.productName)
                        .font(.system(size: 20, weight: .bold, design: .monospaced))
                        .foregroundColor(black)
                        .padding(.top, 10)
                }
                .padding(EdgeInsets(top: 25, leading: 0, bottom: 0, trailing: 10))
                
                HStack( spacing: 15) {
                        
                    Text("Color")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(black)
                        .frame(width: 75, alignment: .leading)
                    
                    ColorButton(index: $selectedColor)
                    
                    Spacer(minLength: 0)
                }.padding(.leading)
                .padding(.top, 10)
                
                HStack( spacing: 15) {
                        
                    Text("Size")
                        .font(.system(size: 22, weight: .bold, design: .monospaced))
                        .foregroundColor(black)
                        .frame(width: 75, alignment: .leading)
                    
                    ForEach(sizes, id: \.self) { title in
                        SizeButton(product: product, size: $selectedSize, title: title)
                    }
                    
                    Spacer(minLength: 0)
                    
                }.padding(.leading)
                .padding(.top, 10)
                
                
                Spacer()
                
                VStack(alignment: .leading){
                 
                    Text("Nike Air is our iconic innovation that uses pressurized air in a durable, flexible membrane to provide lightweight cushioning. The air compresses on impact and then immediately returns to its original shape and volume, ready for the next impact.")
                        .lineLimit(more ? nil : 3)
                    
                    Button(action: {
                        withAnimation {
                            more.toggle()
                        }
                    }) {
                        Text("Read More")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(Color(UIColor(named: product.imageName)!))
                    }
                    
                }
                Spacer()
                
                Button(action: {
                    withAnimation {
                        isAddedInCart.toggle()
                    }
                }) {
                    
                    Label(
                        title: {
                            
                            Text(isAddedInCart ? "Added" : "Add To Cart")
                            .font(.system(size: 22, weight: .bold, design: .monospaced))
                            .foregroundColor(.white)
                            
                        },
                        icon: {
                            Image(systemName: isAddedInCart ? "checkmark.circle.fill" : "cart.badge.plus")
                                .font(.system(size: 22, weight: .bold, design: .monospaced))
                                .foregroundColor(.white)
                        })
                        .padding(.vertical, 12)
                        .frame( width: UIScreen.main.bounds.width - 75)
                        .background(isAddedInCart ? Color.green : Color(UIColor(named: product.imageName)!))
                        .clipShape(Capsule())
                        .padding(.bottom, 40)
                    
                    
                 
                }
                
            }.padding(.leading, 20)
            .background(Color.white)

            
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
