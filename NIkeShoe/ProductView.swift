//
//  ProductView.swift
//  NIkeShoe
//
//  Created by sathish s on 18/04/2021.
//

import SwiftUI

struct ProductView: View {
    var body: some View {
        HeaderView()
        GeometryReader { bounds in
           
            ScrollView {
        VStack(alignment: .center,spacing: 0) {
            VStack {
                HStack{
                    VStack(alignment: .leading,spacing: 10){
                    Text("Welcome sathish!")
                        .font(.system(size: 15))
                   
                    Text("DISCOVER THE")
                        .font(.title)
                        .fontWeight(.bold)
                        
                        Text("NEWEST SHOES!")
                            .font(.title)
                            .fontWeight(.bold)
                }
                    .padding()
                    Spacer()
                }
                SearchView()
                
                segmantView()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20){
                        ForEach(getProductList()) { item in
                            GeometryReader { geomentry in
                                ProductRow(product:item)
                                    .rotation3DEffect(Angle(degrees:  Double(geomentry.frame(in: .global).minX - 30) / -getAngleMultiplier(bounds: bounds)), axis:(x: 0, y: 10.0, z: 0))
                                }
                                .frame(width: 275, height: 275)
                            }
                        }
                        .padding(30)
                        .padding(.bottom, 30)
                    }
                    .offset(y: -30)
                Spacer()
     
            }
        }
           Spacer(minLength: 10)
                VStack{
                    Text("POPULAR")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    ForEach(getProductList().reversed()) { item in
                            ProductList(product: item)
                                
                        }
                }
                

        }
            
    }

        
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}

struct ProductList: View {
    var product: Product
    var body: some View {
        HStack(spacing: 15) {
            Image(product.imageName)
                .resizable()
                .frame(width: 150, height: 130)
            
            VStack(alignment: .leading, spacing: 12) {
                
                Text(product.productName)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                Text(product.productDiscription)
                    .foregroundColor(.secondary)
            }
        }
        .background(Color.gray.opacity(0.05))
//        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 6, y: 6)
        .cornerRadius(15)
    }
}

struct ProductRow: View {
    var product: Product
    @State private var presentedAsModal = false
    var body: some View {
        HStack(spacing: 15) {
            VStack(alignment: .leading, spacing: 12) {
                
                ZStack{
                    Arc(startAngle: .degrees(0), endAngle: .degrees(130), clockwise: true)
                        .stroke(Color(UIColor(named: product.imageName)!), lineWidth: 20)
                        .frame(width: 70, height: 70)
                        .animation(.easeIn)
                    Image(product.imageName)
                        .resizable()
                        .rotationEffect(.degrees(-25))
                        .frame(width: 170, height: 150)
                        .padding(.top, 20)
                    
                }
                
                Text(product.productName)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
    
                HStack(spacing: 15){
                    Text(product.productDiscription)
                        .foregroundColor(.secondary)
                    Spacer()
                    StarsView(rating: 3.5, maxRating: 5)
                }
                
            }
            .padding()
            Spacer(minLength: 0)
        }
        .sheet(isPresented: self.$presentedAsModal) { //TODO: Replace sheet with fullScreenCover for iOS 14+
            ProductDetaileView(product: product)
        }
        .onTapGesture {
            presentedAsModal.toggle()
        }
      
        .padding()
        .background(Color(UIColor(named: product.imageName)!).opacity(0.3))
        .cornerRadius(15)
    }
}



struct Product: Identifiable {
    var id = UUID()
    var imageName: String
    var productName: String
    var productDiscription: String
}

func getProductList() -> [Product] {
    
    return
        [Product(imageName: "shoe-1",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),
         
         Product(imageName: "shoe-2",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),
         
         Product(imageName: "shoe-3",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),
         
         Product(imageName: "shoe-4",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),

         Product(imageName: "shoe-5",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),

         Product(imageName: "shoe-6",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),
         
         Product(imageName: "shoe-7",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),
         
         Product(imageName: "shoe-8",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),
         
         Product(imageName: "shoe-9",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),
         
         Product(imageName: "shoe-10",
                 productName: "Downshifter 10 Running Shoes",
                 productDiscription: "₹15,595"),
         
        ]
}

struct segmantView: View {
    let categories = ["BEST SELLER", "FREATURED", "NEWEST", "MEN"]
    @State private var selected = 0

    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20){
                ForEach(0..<categories.count) { index in
                    VStack {
                        Text(self.categories[index])
                            .font(selected == index ? .headline : .subheadline)
                            .fontWeight(selected == index ? .heavy : .regular)
                            .foregroundColor(selected == index ? .black : .gray)
                    }
                    .onTapGesture {
                        selected = index
                    }
                    
                    }
                }
           
                .padding()
            }
        }
    }
}


struct StarsView: View {
    var rating: CGFloat
    var maxRating: Int

    var body: some View {
        let stars = HStack(spacing: 0) {
            ForEach(0..<maxRating) { _ in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
        }

        stars.overlay(
            GeometryReader { g in
                let width = rating / CGFloat(maxRating) * g.size.width
                ZStack(alignment: .leading) {
                    Rectangle()
                        .frame(width: width)
                        .foregroundColor(.yellow)
                }
            }
            .mask(stars)
        )
        .foregroundColor(.gray)
    }
}




struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise)

        return path
    }
}


func getAngleMultiplier(bounds: GeometryProxy) -> Double {
    if bounds.size.width > 500 {
        return 80
    } else {
        return 20
    }
}

