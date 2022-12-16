//
//  ContentView.swift
//  ProductAssignment
//
//  Created by Dinesh Sharma on 13/12/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var productListViewModel = ProductListViewModel()
    
    var body: some View {
        if productListViewModel.isLoading {
            LoadingView()
        }else if productListViewModel.errorMessage != nil {
            ErrorView(productListViewModel: productListViewModel)
        } else{
            ProductListView().environmentObject(productListViewModel)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
