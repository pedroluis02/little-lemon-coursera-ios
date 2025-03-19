//
//  MenuItemDetailsView.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    let item: MenuItem
    
    var body: some View {
        NavigationView {
            VStack {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                
                Text("Price:").bold()
                Text("\(item.price.formatted())")
                    .padding(.bottom, 8)
                
                Text("Ordered:").bold()
                Text("\(item.ordersCount)")
                    .padding(.bottom, 8)
                
                Text("Ingredients:").bold()
                ForEach(item.ingredients, id: \.rawValue) { ingredient in
                    Text(ingredient.rawValue)
                }
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.large)
        .navigationTitle(item.title)
    }
}

#Preview {
    MenuItemDetailsView(item: MenuItem(title: "Food 5", ingredients: [.spinach, .broccoli, .carrot, .pasta], menuCategory: MenuCategory.food))
    
}
