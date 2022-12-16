//
//  ProductListView.swift
//  ProductAssignment
//
//  Created by Dinesh Sharma on 13/12/22.
//

import SwiftUI

struct ProductListView: View {
    @EnvironmentObject var productListViewModel: ProductListViewModel
    
    var body: some View {
        TabView{
            NavigationView {
                List {
                    ForEach($productListViewModel.productList ) { product in
                        if let imageURL = product.wrappedValue.imageURL, let name =  product.wrappedValue.title, let price = product.wrappedValue.price?[0].value, let ratingCount =  product.wrappedValue.ratingCount, let addToCartButtonText = product.wrappedValue.addToCartButtonText?.rawValue {
                            
                            NavigationLink {
                                ProductDetailView(imageURL: imageURL, name: name, price: price, ratingCount: ratingCount, isInWishlist: product.isInWishlist , addToCartButtonText: addToCartButtonText)
                            } label: {
                                ProductListRow(imageURL: imageURL, name: name, price: price, ratingCount: ratingCount, isInWishlist: product.isInWishlist , addToCartButtonText: addToCartButtonText)
                            }
                        }
                    }
                }
                .navigationTitle("Product List")
            }.tabItem({
                Text("Product List")
            })
            
            NavigationView{
                List {
                    ForEach($productListViewModel.productList) { product in
                        if let imageURL = product.wrappedValue.imageURL, let name =  product.wrappedValue.title, let price = product.wrappedValue.price?[0].value, let ratingCount =  product.wrappedValue.ratingCount, let addToCartButtonText = product.wrappedValue.addToCartButtonText?.rawValue {
                            
                            if let isInWishlist =  product.wrappedValue.isInWishlist, isInWishlist  {
                                NavigationLink {
                                    ProductDetailView(imageURL: imageURL, name: name, price: price, ratingCount: ratingCount, isInWishlist: product.isInWishlist , addToCartButtonText: addToCartButtonText)
                                    
                                } label: {
                                    ProductListRow(imageURL: imageURL, name: name, price: price, ratingCount: ratingCount, isInWishlist: product.isInWishlist , addToCartButtonText: addToCartButtonText)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("Favourite List")
            }.tabItem(){
                Text("Favourite List")
            }
        }
        
    }
}

struct ProductListView_Previews: PreviewProvider {
    @State static var products = ProductListViewModel.successState().productList
    static var previews: some View {
        ProductListView().environmentObject(ProductListViewModel())
    }
}
