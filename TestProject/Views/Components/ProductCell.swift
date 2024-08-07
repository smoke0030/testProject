//
//  ProductCell.swift
//  TestProject
//
//  Created by Сергей on 05.08.2024.
//

import SwiftUI

struct ProductCell: View {
    
    var product: Product
    @State var isAdded: Bool = false
    @State var addCount: Double = 0
    
    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                
                product.image
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                HStack {
                    Spacer()
                    VStack {
                        Button(action: {
                            print("Check")
                        }, label: {
                            Image("Check")
                        })
                        .frame(width: 32, height: 32)
                        
                        Button(action: {
                            print("isFavourite")
                        }, label: {
                            Image(systemName: product.isFavourite ? "heart.fill" : "heart")
                                .foregroundColor(.gray)
                        })
                        .frame(width: 32, height: 32)
                    }
                    .background(Color.white)
                    .clipShape(.capsule)
                    .padding(9)
                    .opacity(0.6)
                }
                if product.onSale! {
                    Text("Удар по ценам")
                        .padding(3)
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                        .background(Color.pinkRed)
                        .cornerRadius(6)
                        .padding(.leading, 1)
                    
                    
                } else if product.isNew! {
                    Text("Новинка")
                        .padding(3)
                        .font(.system(size: 10))
                        .foregroundColor(.white)
                        .background(Color.violetTest)
                        .cornerRadius(6)
                        .padding(.leading, 1)
                }
            }
            VStack(alignment: .leading) {
                HStack {
                    Image(systemName: "star.fill")
                        .frame(width: 12, height: 12)
                        .foregroundColor(.yellow)
                    Text("\(product.rating, specifier: "%.1f")")
                        .font(.system(size: 12))
                    Spacer()
                }
                .padding(.horizontal, 8)
                
                Text(product.name)
                    .font(.system(size: 12))
                    .padding(.horizontal, 8)
                    .padding(.top, 8)
                    .lineLimit(2)
                if isAdded {
                    HStack(alignment: .center) {
                        Button(action: {
                            if addCount <= 0.11 {
                                addCount = 0
                                isAdded = false
                            } else {
                                print(addCount)
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
                            Text("~ \(product.price * Float(addCount), specifier: "%.2f") ₽" )
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
                    .frame(width: screen.width * 0.43, height: 36)
                    .background(Color.greenTest)
                    .cornerRadius(40)
                    .padding(4)
                    .padding(.top, 30)
                    
                } else {
                    
                    HStack {
                        VStack(alignment: .leading) {
                            let wholePrice = Int(product.price)
                            let decimalPart = String(format: "%.2f", product.price).split(separator: ".").last ?? ""
                            HStack(spacing: 0) {
                                Text("\(wholePrice) ")
                                    .font(.system(size: 20, weight: .semibold))
                                Text(" \(decimalPart)")
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
                        .padding(.horizontal, 8)
                        
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
                        .background(Color.greenTest)
                        .clipShape(.capsule)
                        .padding(4)
                        
                    }
                    .padding(.top, 30)
                }
            }
        }
        .frame(width: screen.width * 0.45, height: screen.width * 0.75)
        .background(Color.white)
        .cornerRadius(16)
        .shadow(radius: 1)
        .padding(8)
        .animation(Animation.linear(duration: 0.5), value: isAdded)
    }
}

struct ProductCell_preview: PreviewProvider {
    @State static var isFavourite = false
    
    
    static var previews: some View {
        ProductCell(product: Product(id: "1", image: Image("Image1"), name: "Дорадо Охлажденная Непотрошеная 300-400г", price: 99.9, fullPrice: 109.9, rating: 4.1, country: nil, isFavourite: false, isNew: false, onSale: true)
                    
        )}
}
