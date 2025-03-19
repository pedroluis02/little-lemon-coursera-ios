//
//  MenuViewViewModel.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

import Foundation

@Observable
class MenuViewViewModel {
    
    @ObservationIgnored
    private let dataSource: MenuItemDataSource
    
    init(dataSource: MenuItemDataSource) {
        self.dataSource = dataSource
    }
    
    var config = FilterConfig()
    
    var foodMenuItems: [MenuItem] {
        applySorting(dataSource.foodMenuItems)
    }
    
    var drinkMenuItems: [MenuItem] {
        applySorting(dataSource.drinkMenuItems)
    }
    
    var dessertMenuItems: [MenuItem] {
        applySorting(dataSource.dessertMenuItems)
    }
    
    func isCategoryActive(_ category: MenuCategory) -> Bool {
        return config.selectedCategories.contains(category)
    }
    
    private func applySorting(_ list: [MenuItem]) -> [MenuItem] {
        switch(config.sortBy) {
        case .mostPopular: list.sorted { $0.ordersCount > $1.ordersCount }
        case .price: list.sorted { $0.price < $1.price }
        case .asc: list.sorted { $0.title < $1.title }
        default: list
        }
    }
}
