//
//  MenuItem.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

import Foundation

struct MenuItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    var ingredients: [Ingredient]
    var ordersCount: Int = 0
    var price2: Int = 0
    let menuCategory: MenuCategory
}

extension MenuItem: MenuItemProtocol {
    
    var price: Double {
        Double(price2) + 0.99
    }
    
}
