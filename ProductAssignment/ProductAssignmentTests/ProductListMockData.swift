//
//  ProductList.swift
//  ProductAssignmentTests
//
//  Created by Dinesh Sharma on 16/12/22.
//

import Foundation
// This ProductList class for using mock data to test scenario in unit test case
struct ProductListMockData {
    
    var mockProductList:[ProductItem] = [
        ProductItem(title: "Diamond Label Shiraz", id: "23124", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: 9.40, ratingCount: 4.0,  isInWishlist: false, addToCartButtonText: "Add to cart", totalReviewCount: 11),
        ProductItem(title: "Shiraz", id: "144469", imageURL: "https://media.danmurphys.com.au/dmo/product/144469-1.png?impolicy=PROD_SM", price: 17.95, ratingCount: 4.3364,  isInWishlist: false, addToCartButtonText: "Add to cart", totalReviewCount: 220),
        ProductItem(title: "Bin 389 Cabernet Shiraz 2019", id: "172736", imageURL: "https://media.danmurphys.com.au/dmo/product/172736-1.png?impolicy=PROD_SM", price: 95.00, ratingCount: 3.0,  isInWishlist: false, addToCartButtonText: "Edit quantity", totalReviewCount: 2),
        ProductItem(title: "Shiraz", id: "322002", imageURL: "https://media.danmurphys.com.au/dmo/product/322002-1.png?impolicy=PROD_SM", price: 14.95, ratingCount: 3.8556,  isInWishlist: false, addToCartButtonText: "Add to cart", totalReviewCount: 90),
        ProductItem(title: "Cabernet Sauvignon", id: "144468", imageURL: "https://media.danmurphys.com.au/dmo/product/144468-1.png?impolicy=PROD_SM", price: 17.95, ratingCount: 4.52,  isInWishlist: false, addToCartButtonText: "Add to cart", totalReviewCount: 50)
    ]

    func getMockProductList() -> [ProductItem] {
        return mockProductList
    }
}


struct ProductItem {
    var imageURL:String?
    var id:String?
    var name:String?
    var price: Double?
    var ratingCount: Double?
    var isInWishlist: Bool?
    var addToCartButtonText: String?
    
    init(title: String, id: String, imageURL: String, price: Double,
         ratingCount: Double, isInWishlist: Bool, addToCartButtonText:String, totalReviewCount: Int){
        self.name = title
        self.imageURL = imageURL
        self.price = price
        self.ratingCount = ratingCount
        self.isInWishlist = isInWishlist
        self.addToCartButtonText = addToCartButtonText
    }
}
