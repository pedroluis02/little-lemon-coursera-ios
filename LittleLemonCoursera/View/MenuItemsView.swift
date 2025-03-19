//
//  MenuItemsView.swift
//  LittleLemonCoursera
//
//  Created by Pedro Luis on 11/03/25.
//

import SwiftUI

struct MenuItemsView: View {
    @State private var viewModel = MenuViewViewModel(dataSource: MenuItemDataSourceMock())
    @State private var showingPopover = false
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20, pinnedViews: [.sectionHeaders]) {
                    if (viewModel.isCategoryActive(MenuCategory.food)) {
                        SectionMenuItemView(MenuCategory.food, viewModel.foodMenuItems)
                    }
                    
                    if (viewModel.isCategoryActive(MenuCategory.drink)) {
                        SectionMenuItemView(MenuCategory.drink,  viewModel.drinkMenuItems)
                    }
                    
                    if (viewModel.isCategoryActive(MenuCategory.dessert)) {
                        SectionMenuItemView(MenuCategory.dessert,  viewModel.dessertMenuItems)
                    }
                }.padding()
            }.navigationBarTitleDisplayMode(.large)
                .navigationTitle("Menu")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: { showingPopover = true }) {
                            Label("", systemImage: "gear")
                        }.popover(isPresented: $showingPopover, arrowEdge: .top) {
                            MenuItemsOptionView(viewModel.config) { newConfig in
                                showingPopover = false
                                viewModel.config = newConfig
                            }
                        }
                    }
                }
        }
    }
}

private struct SectionMenuItemView: View {
    private let category: MenuCategory
    private let items: [MenuItem]
    
    init(_ category: MenuCategory, _ items: [MenuItem]) {
        self.category = category
        self.items = items
    }
    
    var body: some View {
        Section {
            ForEach(items, id: \.id) { item in
                VStack {
                    NavigationLink {
                        MenuItemDetailsView(item: item)
                    } label: {
                        Rectangle()
                            .fill(Color.black)
                            .frame(height: 100)
                    }
                    Text(item.title)
                }
            }
        } header: {
            HStack {
                Text(category.rawValue)
                    .font(.title)
                Spacer()
            }
        }
    }
}

#Preview {
    MenuItemsView()
}
