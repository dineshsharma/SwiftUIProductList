//
//  ProductListViewModel.swift
//  ProductAssignment
//
//  Created by Dinesh Sharma on 13/12/22.
//

import Foundation

class ProductListViewModel: ObservableObject {
    @Published var productList: [Product] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let productListResponse = ProductListResponse()
    init() {
        fetuchProductList()
    }
    
    func fetuchProductList() {
        isLoading = true
        errorMessage = nil
        self.productListResponse.fetchProductList { [unowned self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                case .success(let responseData):
                    self.productList = responseData.products
                case .none:
                    break
                }
            }
        }
    }

    //MARK: preview helpers

    static func errorState() -> ProductListViewModel {
        let viewModel = ProductListViewModel()
        viewModel.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return viewModel
    }

    static func successState() -> ProductListViewModel {
        let viewModel = ProductListViewModel()
        viewModel.productList = [Product.example1(), Product.example2()]
        
        return viewModel
    }
}
