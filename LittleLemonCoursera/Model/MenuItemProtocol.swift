//
//  MenuItemProtocol.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var price2: Int { get set }
    var ingredients: [Ingredient] { get set }
}
