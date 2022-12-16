//
//  Common.swift
//  ProjectAssignamet
//
//  Created by Dinesh Sharma on 12/12/22.
//

import Foundation
import SwiftUI
struct Constants {
    static let ErrorAlertTitle = "Error"
    static let OkAlertTitle = "Ok"
    static let CancelAlertTitle = "Cancel"
    static let AddToCartAlertTitle = "Add To Cart"
}

struct ApiEndpoint
{
    static let productList = "https://run.mocky.io/v3/2f06b453-8375-43cf-861a-06e95a951328"
}

// MARK: Image Loading
@ViewBuilder func imageLoading(imageURL : String, width: CGFloat, height: CGFloat) -> some View {
    AsyncImage(url: URL(string: imageURL)) { phase in
        if let image = phase.image {
            image.resizable()
                .scaledToFill()
                .frame(width: width, height: height)
                .clipped()
            
        } else if phase.error != nil {
            
            Text(phase.error?.localizedDescription ?? "error")
                .foregroundColor(Color.pink)
                .frame(width: width, height: height)
        } else {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}
