//
//  MainView.swift
//  TestProject
//
//  Created by Сергей on 05.08.2024.
//

import SwiftUI

struct MainView: View {
    @State var isGrid = true
    @State var isAddedToCart = false
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        Button(action: {
            withAnimation {
                isGrid.toggle()
            }
            
        }, label: {
            Image(systemName: isGrid ? "square.grid.2x2" : "rectangle.grid.1x2")
                .foregroundColor(.green)
        })
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        
        if isGrid {
            ScrollView(.vertical, showsIndicators: false) {
                Section {
                    LazyVGrid(columns: columns, spacing: 4) {
                        ForEach(ProductsViewModel.shared.products, id: \.id) { item in
                            ProductCell(product: item)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .transition(.scale)
        } else {
            ScrollView {
                Section {
                    LazyVStack {
                        ForEach(ProductsViewModel.shared.products.indices, id: \.self) { index in
                            ProductCellList(product: ProductsViewModel.shared.products[index])
                            if index != ProductsViewModel.shared.products.count - 1 {
                                Divider()
                            }
                        }
                    }
                    
                }
            }
            .transition(.scale)
        }
    }
}

#Preview {
    MainView()
}
