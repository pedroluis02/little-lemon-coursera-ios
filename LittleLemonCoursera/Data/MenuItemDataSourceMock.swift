//
//  MenuItemDataSourceMock.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

import Foundation

class MenuItemDataSourceMock: MenuItemDataSource {
    
    private let food = MenuItemDataSourceMock.createMenuItems(12) {
        MenuItemDataSourceMock.createMenuItem(MenuCategory.food, $0, [.spinach, .broccoli, .carrot, .pasta])
    }
    
    private let drink = MenuItemDataSourceMock.createMenuItems(8) {
        MenuItemDataSourceMock.createMenuItem(MenuCategory.drink, $0, [.carrot])
    }
    
    private let dessert = MenuItemDataSourceMock.createMenuItems(4) {
        MenuItemDataSourceMock.createMenuItem(MenuCategory.dessert, $0, [.spinach, .broccoli, .carrot])
    }
    
    var foodMenuItems: [MenuItem] {
        food
    }
    
    var drinkMenuItems: [MenuItem] {
        drink
    }
    
    var dessertMenuItems: [MenuItem] {
        dessert
    }
    
    private static func createMenuItems(_ size: Int, _ transform: (Int) -> MenuItem) -> [MenuItem] {
        return Array(1...size).map(transform)
    }
    
    private static func createMenuItem(_ menuCategory: MenuCategory, _ index: Int, _ ingredients: [Ingredient]) -> MenuItem {
        var item = MenuItem(title: "\(menuCategory.rawValue) \(index)", ingredients: ingredients, menuCategory: menuCategory)
        item.ordersCount = Int.random(in: 1000..<10000)
        item.price2 = Int.random(in: 10..<100)
        return item
    }
}
