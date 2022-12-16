//
//  ErrorView.swift
//  ProductAssignment
//
//  Created by Dinesh Sharma on 13/12/22.
//

import SwiftUI

struct ErrorView: View {
    @StateObject var productListViewModel = ProductListViewModel()

    var body: some View {
        VStack {
            Text("😭")
                .font(.system(size: 80))
            Text(productListViewModel.errorMessage ?? "")
            
            Button {
                productListViewModel.fetuchProductList()
            } label: {
                Text("Try again")
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(productListViewModel:ProductListViewModel())
    }
}
