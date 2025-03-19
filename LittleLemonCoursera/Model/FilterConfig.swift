//
//  FilterConfig.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

struct FilterConfig {
    var selectedCategories = getAllCategories()
    var sortBy:  SortMenuItemOption? = nil
    
    static func getAllCategories() -> Set<MenuCategory> {
        var list = Set<MenuCategory>()
        MenuCategory.allCases.forEach { list.insert($0) }
        return list
    }
}
