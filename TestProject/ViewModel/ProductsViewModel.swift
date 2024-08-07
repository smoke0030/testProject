//
//  ProductsViewModel.swift
//  TestProject
//
//  Created by Сергей on 06.08.2024.
//

import Foundation
import SwiftUI

class ProductsViewModel: ObservableObject {
    
    static let shared = ProductsViewModel()
    
    let products: [Product] = [Product(id: "1", 
                                       image: Image("Image1"),
                                       name: "Энергетический напиток",
                                       price: 99.9, fullPrice: 109.9,
                                       rating: 4.1, country: "Франция",
                                       isFavourite: false,
                                       isNew: false,
                                       onSale: false),
                               Product(id: "2", image: Image("Image2"),
                                       name: "Дорадо Охлажденная Непотрошеная 300-400г",
                                       price: 90.9, fullPrice: 109.9,
                                       rating: 4.1, country: "Испания",
                                       isFavourite: true,
                                       isNew: true,
                                       onSale: false),
                               Product(id: "3", image: Image("Image3"),
                                       name: "Зимняя вишня",
                                       price: 99.9, fullPrice: 109.9,
                                       rating: 4.1, country: nil,
                                       isFavourite: false,
                                       isNew: false,
                                       onSale: true),
                               Product(id: "4", image: Image("Image4"),
                                       name: "Это танцы обниманцы",
                                       price: 99.9, fullPrice: 109.9,
                                       rating: 4.1, country: nil,
                                       isFavourite: false,
                                       isNew: false,
                                       onSale: false),
                               Product(id: "5", image: Image("Image5"),
                                       name: "Овощной салатик",
                                       price: 99.9, fullPrice: 109.9,
                                       rating: 4.1, country: nil,
                                       isFavourite: true,
                                       isNew: false,
                                       onSale: false),
                               Product(id: "6", image: Image("Image6"),
                                       name: "Курочка в кляре",
                                       price: 99.9, fullPrice: 109.9,
                                       rating: 4.1, country: nil,
                                       isFavourite: false,
                                       isNew: false,
                                       onSale: false),
                               Product(id: "7", image: Image("Image7"),
                                       name: "Шашлык из баранины",
                                       price: 99.9, fullPrice: 109.9,
                                       rating: 4.1, country: nil,
                                       isFavourite: true,
                                       isNew: false,
                                       onSale: false),
                               Product(id: "8", image: Image("Image8"),
                                       name: "Хачапурики",
                                       price: 99.9, fullPrice: 109.9,
                                       rating: 4.1, country: nil,
                                       isFavourite: false,
                                       isNew: false,
                                       onSale: false),
                               Product(id: "9", image: Image("Image9"),
                                       name: "Мсье томато",
                                       price: 99.9, fullPrice: 109.9,
                                       rating: 4.1, country: nil,
                                       isFavourite: false,
                                       isNew: false,
                                       onSale: false)]
}
