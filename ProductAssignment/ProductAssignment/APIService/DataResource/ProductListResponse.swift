//
//  DataResource.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 12/12/22.
//

import Foundation

import Foundation

struct ProductListResponse
{
    func getProductList(completion: @escaping(_ result : Result<ProductListResponseData, APIError>?) -> Void)
    {
        let apiService = APIService()

        let productListEndpoint = ApiEndpoint.productList

        let requestUrl = URL(string:productListEndpoint)!
     
        apiService.getApiData(requestUrl: requestUrl, resultType: ProductListResponseData.self) { (productListApiResponse) in

            _ = completion(productListApiResponse)
        }
    }
    
    func fetchProductList(completion: @escaping(_ result : Result<ProductListResponseData, APIError>?) -> Void)
    {
        let apiService = APIService()

        let productListEndpoint = ApiEndpoint.productList

        let requestUrl = URL(string:productListEndpoint)!
        
        apiService.fetchProductList(url: requestUrl) { result in

            _ = completion(result)
        }
    }
}

