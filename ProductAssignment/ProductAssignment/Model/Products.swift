//
//  Products.swift
//  ProductAssignment
//
//  Created by Dinesh Sharma on 13/12/22.
//

import Foundation

// MARK: - ProductList
struct ProductListResponseData: Decodable {
    let products: [Product]
}

// MARK: - Product
struct Product: Decodable, Identifiable {
    let title, id: String?
    let imageURL: String?
    let price: [Price]?
    var isInWishlist: Bool?
    let ratingCount: Double?
    let addToCartButtonText: AddToCartButtonText?
    let totalReviewCount: Int?

    enum CodingKeys: String, CodingKey {
        case title
        case id
        case imageURL
        case price
        case ratingCount
        case addToCartButtonText
        case isInWishlist
        case totalReviewCount
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        isInWishlist = try values.decodeIfPresent(Bool.self, forKey: .isInWishlist)
        ratingCount = try values.decodeIfPresent(Double.self, forKey: .ratingCount)
        addToCartButtonText = try values.decodeIfPresent(AddToCartButtonText.self, forKey: .addToCartButtonText)
        totalReviewCount = try values.decodeIfPresent(Int.self, forKey: .totalReviewCount)
        price = try values.decodeIfPresent([Price].self, forKey: .price)
    }
    
    init(title: String, id: String, imageURL: String, price: [Price],
         ratingCount: Double, isInTrolley: Bool, isInWishlist: Bool, addToCartButtonText:AddToCartButtonText, totalReviewCount: Int){
        self.title = title
        self.id = id
        self.imageURL = imageURL
        self.price = price
        self.ratingCount = ratingCount
        self.isInWishlist = isInWishlist
        self.addToCartButtonText = addToCartButtonText
        self.totalReviewCount = totalReviewCount
    }
    
    static func example1() -> Product {
        return Product(title: "Example1", id: "1234", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], ratingCount: 4.5, isInTrolley: false, isInWishlist: false, addToCartButtonText: AddToCartButtonText(rawValue: "Add to Cart")!, totalReviewCount: 167)
    }

    static func example2() -> Product {
        return Product(title: "Example2", id: "1235", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 7.0, isOfferPrice: false)], ratingCount: 4.2, isInTrolley: false, isInWishlist: true, addToCartButtonText: AddToCartButtonText(rawValue: "Add to Cart")!, totalReviewCount: 167)
    }
}

enum AddToCartButtonText: String, Decodable {
    case addToCart = "Add to cart"
    case editQuantity = "Edit quantity"
}

// MARK: - Price
struct Price: Decodable {
    let message: Message
    let value: Double
    let isOfferPrice: Bool
}

enum Message: String, Decodable {
    case inAnySix = "in any six"
    case perBottle = "per bottle"
}



