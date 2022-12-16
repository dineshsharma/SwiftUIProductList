//
//  ProductListResourceUnitTests.swift
//  ProductAssignmentTests
//
//  Created by Dinesh Sharma on 16/12/22.
//

import XCTest

@testable import ProductAssignment

final class ProductListResponseUnitTests: XCTestCase {

    func testFetchProductListSuccessfullAPI() {
        let resource = ProductListResponse()
        let expectation = self.expectation(description: "FetchProductListAPI")
        resource.fetchProductList { [weak self] result in
            XCTAssertNotNil(result)
            switch result {
            case .success(let productList):
                self?.checkSuccessResponse(productList: productList.products)
            case .failure(let error):
                self?.checkFailureResponse(error: error)
            case .none:
                break
            }
            
            expectation.fulfill()
        }
        waitForExpectations(timeout: 20, handler: nil)
    }
    
    private func checkSuccessResponse(productList: [Product]) {
        let mockData =  ProductListMockData()
        let mockProductList = mockData.getMockProductList()
        
        XCTAssertNotNil(productList)

        for i in 1..<mockProductList.count {
            let product = productList[i]
            let mockProduct = mockProductList[i]
            XCTAssertEqual(product.imageURL, mockProduct.imageURL, "imageURL")
            XCTAssertEqual(product.isInWishlist, mockProduct.isInWishlist, "isInWishlist")
            XCTAssertEqual(product.ratingCount, mockProduct.ratingCount, "ratingCount")
            XCTAssertEqual(product.title, mockProduct.name, "Product Name")
            XCTAssertEqual(product.addToCartButtonText?.rawValue, mockProduct.addToCartButtonText, "Add To Cart Button Title")
            XCTAssertEqual(product.price?[0].value, mockProduct.price, "Product Price")

        }
    }
    private func checkFailureResponse(error: APIError) {
    XCTAssertNil(error)
    }
}
