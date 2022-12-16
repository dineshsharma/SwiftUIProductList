//
//  ProductDetailView.swift
//  ProductAssignment
//
//  Created by Dinesh Sharma on 13/12/22.
//

import SwiftUI

struct ProductDetailView: View {
    let imageSize: CGFloat = 300
    
    var imageURL:String
    var name:String
    var price: Double
    var ratingCount: Double
    @Binding var isInWishlist: Bool?
    var addToCartButtonText: String
    
    var body: some View {
        ScrollView {
            VStack {
                if !imageURL.isEmpty {
                    imageLoading(imageURL: imageURL, width: imageSize, height: imageSize)
                }else {
                    Color.gray.frame(height: imageSize)
                }
                
                VStack(alignment: .leading, spacing: 15) {
                    Text(name)
                        .font(.headline)
                    Text("Price: \(String(price))")
                        .font(.title2)
                    Text("Rating: \(ratingCount)")
                        .font(.title2)
                    
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
                                .frame(width:40, height: 40, alignment: .center)
                        }
                    }
                    
                    
                    Spacer()
                }.padding()
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}


struct ProductDetailView_Previews: PreviewProvider {
    @State static var product = Product.example1()
    static var previews: some View {
        ProductDetailView(imageURL: product.imageURL ?? "", name: product.title ?? "", price: product.price?[0].value ?? 0.0, ratingCount: product.ratingCount ?? 0.0, isInWishlist: .constant(false), addToCartButtonText: product.addToCartButtonText?.rawValue ?? "")
    }
}
