//
//  APIServiceProtocol.swift
//  APIServiceProtocol
//
//  Created by Dinesh Sharma on 12/12/22.
//

import Foundation

protocol APIServiceProtocol {
    func fetchProductList(url: URL?, completionHandler: @escaping(Result<ProductListResponseData, APIError>) -> Void)
}
