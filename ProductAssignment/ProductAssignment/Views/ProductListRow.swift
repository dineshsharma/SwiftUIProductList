//
//  ProductListRow.swift
//  ProductAssignment
//
//  Created by Dinesh Sharma on 13/12/22.
//

import SwiftUI

struct ProductListRow: View {
    
    private let imageSize:CGFloat = 100
    
    var imageURL:String
    var name:String
    var price: Double
    var ratingCount: Double
    @Binding var isInWishlist: Bool?
    var addToCartButtonText: String
    
    @State private var showingAlert = false
    
    var body: some View {
        HStack {
            if !imageURL.isEmpty {
                imageLoading(imageURL: imageURL, width: imageSize, height: imageSize)
            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.headline)
                //Text("Price: \(String(product.price[0].value))")
                Text("Price: \(String(price))")
                
                HStack{
                    Button(addToCartButtonText){
                        showingAlert.toggle()
                    }.buttonStyle(.bordered)
                        .alert(Constants.AddToCartAlertTitle, isPresented: $showingAlert) {
                        } message: {
                            Text("")
                        }
                    Spacer()
                    Button(action:{
                        if var isInWishlistUnWrapped = isInWishlist {
                            isInWishlistUnWrapped.toggle()
                            isInWishlist = isInWishlistUnWrapped
                        }
                        
                        
                    }) {
                        if let isInWishlist = isInWishlist {
                            Image(isInWishlist == true ? "favIcon" : "unfavIcon")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35.0,height: 35.0)
                        }
                        
                    }.buttonStyle(.borderless)
                }
            }
        }
    }
}

struct ProductListRow_Previews: PreviewProvider {
    @State static var product = Product.example1()
    static var previews: some View {
        ProductListRow(imageURL: product.imageURL ?? "", name: product.title ?? "", price: product.price?[0].value ?? 0.0, ratingCount: product.ratingCount ?? 0.0, isInWishlist: .constant(false), addToCartButtonText: product.addToCartButtonText?.rawValue ?? "")
            .previewLayout(.fixed(width: 400, height: 200))
    }
}

