//
//  ProductAssignmentTests.swift
//  ProductAssignmentTests
//
//  Created by Dinesh Sharma on 13/12/22.
//

import XCTest
@testable import ProductAssignment

final class ProductAssignmentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testProductListData() {
        let dummyProductDataList = [
            Product(title: "123-ew-12", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: false, isInWishlist: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 100),
            Product(title: "123-ew-13", id: "1002", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 4.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: true, isInWishlist: false, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 70)]
        
        let viewModel = ProductListViewModel()
        viewModel.fetuchProductList()
        XCTAssert(viewModel.productList.isEmpty,"Product List")

        viewModel.productList = dummyProductDataList
        XCTAssertEqual(viewModel.productList.count, 2, "Product List count")
        
        for index in 0..<viewModel.productList.count {
            let product = viewModel.productList[index]
            let dummyData = dummyProductDataList[index]
            XCTAssertEqual(product.title, dummyData.title, "title")
            XCTAssertEqual(product.isInWishlist, dummyData.isInWishlist, "isInWishlist")
        }
    }
    
    func testProductPrice() {
        let dummyProductDataList = [
            Product(title: "123-ew-12", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: false, isInWishlist: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 100),
            Product(title: "123-ew-13", id: "1002", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 4.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: true, isInWishlist: false, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 70)]
        
        let viewModel = ProductListViewModel()
        viewModel.productList = dummyProductDataList
        XCTAssertEqual(viewModel.productList.count, 2, "Product List count")
        
        for index in 0..<viewModel.productList.count {
            let productPrice = viewModel.productList[index].price?[0]
            let dummyDataPrice = dummyProductDataList[index].price?[0]
            XCTAssertEqual(productPrice?.value, dummyDataPrice?.value, "Value")
            XCTAssertEqual(productPrice?.isOfferPrice, dummyDataPrice?.isOfferPrice, "isOfferPrice")
            XCTAssertEqual(productPrice?.message, dummyDataPrice?.message, "message")
        }
    }
    
    func testCheckAndClearFavouriteProductList() {
        let dummyProductDataList = [
            Product(title: "123-ew-12", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: false, isInWishlist: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 100),
            Product(title: "123-ew-13", id: "1002", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 4.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: true, isInWishlist: false, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 70)]
        
        let viewModel = ProductListViewModel()
        viewModel.productList = dummyProductDataList
        XCTAssertEqual(viewModel.productList.count, dummyProductDataList.count, "Result Count")
    }
    
    func testUpdateFavouriteProductList() {
        let dummyProductDataList = [
            Product(title: "123-ew-12", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: false, isInWishlist: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 100),
            Product(title: "123-ew-13", id: "1002", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 4.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: true, isInWishlist: false, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 70)]
        
        let viewModel = ProductListViewModel()
        viewModel.productList = dummyProductDataList
        XCTAssertEqual(viewModel.productList.count, dummyProductDataList.count, "Result Count")

    }
    
    func testUpdateFavouriteProductListWithFavourite() {
        let dummyProductDataList = [
            Product(title: "123-ew-12", id: "1001", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 6.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: false, isInWishlist: true, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 100),
            Product(title: "123-ew-13", id: "1002", imageURL: "https://media.danmurphys.com.au/dmo/product/23124-1.png?impolicy=PROD_SM", price: [Price(message: Message.inAnySix, value: 4.0, isOfferPrice: false)], ratingCount: 10.0, isInTrolley: true, isInWishlist: false, addToCartButtonText: AddToCartButtonText(rawValue: AddToCartButtonText.editQuantity.rawValue)!, totalReviewCount: 70)]
        
        let viewModel = ProductListViewModel()
        viewModel.productList = dummyProductDataList
        XCTAssertEqual(viewModel.productList.count, dummyProductDataList.count, "Result Count")
    }
}
