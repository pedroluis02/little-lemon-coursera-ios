//
//  MenuItemDataSource.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

import Foundation

protocol MenuItemDataSource {
    var foodMenuItems: [MenuItem] { get }
    var drinkMenuItems: [MenuItem] { get }
    var dessertMenuItems: [MenuItem] { get }
}
