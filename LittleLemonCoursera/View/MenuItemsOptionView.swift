//
//  MenuItemsOptionView.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

import SwiftUI

typealias OnDoneAction = ((FilterConfig) -> Void)

struct MenuItemsOptionView: View {
    
    private let config: FilterConfig
    private let onDone: OnDoneAction?
    
    @State private var selection1: Set<MenuCategory> = []
    
    @State private var selection2: SortMenuItemOption? = nil
    
    init(_ config: FilterConfig, onDone: OnDoneAction? = nil) {
        self.config = config
        self.onDone = onDone
    }
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text(FilterOption.selectedCategories.rawValue)) {
                    ForEach(MenuCategory.allCases, id: \.self) { menuCategory in
                        ListItemClickableView(
                            title: menuCategory.rawValue,
                            isOnChecked: {
                                selection1.contains(menuCategory)
                            },
                            onChange: {
                                if (selection1.contains(menuCategory)) {
                                    selection1.remove(menuCategory)
                                } else {
                                    selection1.insert(menuCategory)
                                }
                            }
                        )
                    }
                }
                
                Section(header: Text(FilterOption.sortmenuItems.rawValue)) {
                    ForEach(SortMenuItemOption.allCases, id: \.rawValue) { menuItemOption in
                        ListItemClickableView(
                            title: menuItemOption.rawValue,
                            isOnChecked:  {
                                selection2 != nil && menuItemOption == selection2
                            },
                            onChange: {
                                selection2 = menuItemOption
                            }
                        )
                    }
                }
            }
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        var newConfig = FilterConfig()
                        if (!selection1.isEmpty) {
                            newConfig.selectedCategories = selection1
                        }
                        newConfig.sortBy = selection2
                        
                        onDone?(newConfig)
                    }
                }
            }.onAppear {
                selection1 = config.selectedCategories
                selection2 = config.sortBy
            }
        }
    }
}

private struct ListItemClickableView: View {
    let title: String
    let isOnChecked: () -> Bool
    let onChange: () -> Void
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if(isOnChecked()) {
                Image(systemName: "checkmark")
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            onChange()
        }
    }
}

#Preview {
    MenuItemsOptionView(FilterConfig())
}

