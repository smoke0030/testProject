//
//  ProductCellList.swift
//  TestProject
//
//  Created by Сергей on 06.08.2024.
//

import SwiftUI

struct ProductCellList: View {
    
    var product: Product
    @State var isAdded: Bool = false
    @State var addCount: Double = 0
    
    var body: some View {
        HStack(spacing: 8) {
            VStack(alignment: .leading) {
                ZStack(alignment: .topLeading) {
                    product.image
                        .resizable()
                        .frame(width: 144, height: 144)
                        .clipped()
                        .padding(.top, 16)
                    if product.onSale! {
                        Text("Удар по ценам")
                            .padding(2)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .background(Color("PinkRed"))
                            .cornerRadius(6)
                            .offset(x: 3)
                        Text("25%")
                            .frame(maxWidth: 100, maxHeight: .infinity, alignment: .bottomTrailing)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(Color("Crimson"))
                            .padding(.horizontal, 30)
                    } else if product.isNew! {
                        Text("Новинка")
                            .lineLimit(2)
                            .padding(2)
                            .font(.system(size: 10))
                            .foregroundColor(.white)
                            .background(Color("VioletTest"))
                            .cornerRadius(6)
                            .offset(x: 3)
                    }
                    
                }
            }
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("\(product.rating, specifier: "%.1f")")
                                .font(.system(size: 12))
                                .background(alignment: .leading) {
                                    Image(systemName: "star.fill")
                                        .resizable()
                                        .frame(width: 12, height: 12)
                                        .foregroundColor(.yellow)
                                        .offset(x: -15)
                                }
                            Text("| 19 отзывов")
                                .foregroundColor(.gray)
                                .font(.system(size: 12))
                        }
                        .padding(.leading, 15)
                        
                        Text("\(product.name)")
                            .lineLimit(2)
                            .font(.system(size: 12))
                            .padding(.top, 4)
                        if product.country != nil {
                            Text("\(product.country ?? "")")
                                .font(.system(size: 12))
                                .padding(.top, 4)
                                .background(alignment: .trailing) {
                                    Image("France")
                                        .resizable()
                                        .frame(width: 15, height: 14)
                                        .foregroundColor(.yellow)
                                        .offset(x: 15)
                                }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    VStack() {
                        Button(action: {
                            print("Check")
                        }, label: {
                            Image("Check")
                        })
                        .frame(width: 32, height: 32)
                        
                        Button(action: {
                            print("isFavourite")
                        }, label: {
                            Image(systemName: "heart")
                                .foregroundColor(.gray)
                        })
                        .frame(width: 32, height: 32)
                    }
                    .padding(.top, 16)
                }
                
                if isAdded {
                    HStack(alignment: .center) {
                        Button(action: {
                            if addCount < 0.11 {
                                addCount = 0
                                isAdded = false
                            } else {
                                addCount -= 0.1
                            }
                        }, label: {
                            Image(systemName: "minus")
                        })
                        .foregroundColor(.white)
                        .padding(.horizontal, 11)
                        Spacer()
                        VStack {
                            Text("\(addCount, specifier: "%.1f") кг")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(.white)
                            Text("~\(product.price * Float(addCount), specifier: "%.2f") ₽" )
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.white)
                        }
                        Spacer()
                        Button(action: {
                            print(addCount)
                            if addCount >= 0.1 {
                                addCount += 0.1
                            }
                        }, label: {
                            Image(systemName: "plus")
                        })
                        .foregroundColor(.white)
                        .padding(.horizontal, 11)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 36, alignment: .bottom)
                    .background(Color.green)
                    .clipShape(.capsule)
                    .padding(.top, 30)
                } else {
                    HStack {
                        VStack(alignment: .leading) {
                            let wholePrice = Int(product.price)
                            let decimalPart = String(format: "%.2f", product.price).split(separator: ".").last ?? ""
                            HStack(spacing: 0) {
                                Text("\(wholePrice) ")
                                    .font(.system(size: 20, weight: .semibold))
                                Text(" \(decimalPart) ₽")
                                    .font(.system(size: 16, weight: .semibold))
                                Image("PerAmountIcon")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                            }
                            .padding(0)
                            Text("\(product.fullPrice, specifier: "%.1f")")
                                .strikethrough()
                                .font(.system(size: 12, weight: .regular))
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        Button(action: {
                            isAdded = true
                            addCount += 0.1
                        }, label: {
                            Image("Basket")
                                .renderingMode(.original)
                                .padding(18)
                            
                        })
                        .frame(width: 48, height: 36)
                        .background(Color("GreenTest"))
                        .clipShape(.capsule)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 36, alignment: .bottom)
                    .padding(.top, 30)
                }
            }
            .frame(width: 200, height: 175)
            .padding(.vertical, 16)
        }
        .frame(width: screen.width * 0.9, height: 175)
        .animation(Animation.linear(duration: 0.5), value: isAdded)
    }
}
#Preview {
    ProductCellList(product: Product(id: "1", image: Image("Image3"), name: "Дорадо Охлажденная Непотрошеная 300-400г", price: 99.9, fullPrice: 109.9, rating: 4.1, country: nil, isFavourite: false, isNew: false, onSale: true))
}
