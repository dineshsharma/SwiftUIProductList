//
//  HttpUtility.swift
//  AssigmantSwiftUI
//
//  Created by Dinesh Sharma on 12/12/22.
//

import Foundation
import SwiftUI

struct APIService :APIServiceProtocol {
    
    func getApiData<T:Decodable>(requestUrl: URL?, resultType: T.Type, completionHandler:@escaping(Result<T,APIError>)-> Void)
    {
        guard let url = requestUrl else {
            let error = APIError.badURL
            completionHandler(Result.failure(error))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error as? URLError {
                completionHandler(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completionHandler(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(T.self, from: data)
                    _=completionHandler(Result.success(result))
                }
                catch let error{
                    completionHandler(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }.resume()
    }
    
    func fetchProductList(url: URL?, completionHandler: @escaping (Result<ProductListResponseData, APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completionHandler(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completionHandler(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completionHandler(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(ProductListResponseData.self, from: data)
                    completionHandler(Result.success(result))
                }catch {
                    completionHandler(Result.failure(APIError.parsing(error as? DecodingError)))
                }
            }
        }
        task.resume()
    }
    
}
