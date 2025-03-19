//
//  MenuItemTests.swift
//  MenuItemTests
//
//  Created by Pedro Luis on 11/03/25.
//

import XCTest
@testable import LittleLemonCoursera

final class MenuItemTests: XCTestCase {

    static let menuItemtitle = "My Title"
    static let menuIteIngredients: [Ingredient] = [.broccoli, .carrot]
    
    let menuItem = MenuItem(title: menuItemtitle, ingredients: menuIteIngredients, menuCategory: MenuCategory.food)
    
    func test_createNew_() throws {
        XCTAssert(menuItem.title == MenuItemTests.menuItemtitle)
    }
    
    func test_createNew_2() throws {
        XCTAssert(menuItem.ingredients == MenuItemTests.menuIteIngredients)
    }

}
