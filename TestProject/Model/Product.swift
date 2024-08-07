//
//  Product.swift
//  TestProject
//
//  Created by Сергей on 05.08.2024.
//

import Foundation
import SwiftUI

struct  Product {
    let id: String
    let image: Image
    let name: String
    let price: Float
    let fullPrice: Float
    let rating: Float
    let country: String?
    let isFavourite: Bool
    let isNew: Bool?
    let onSale: Bool?
}
