//
//  LoadingView.swift
//  ProductAssignment
//
//  Created by Dinesh Sharma on 13/12/22.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Text("😎")
            .font(.system(size: 80))
        ProgressView()
        Text("Getting the Products ...")
            .foregroundColor(.gray)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
