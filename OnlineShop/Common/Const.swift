//
//  Const.swift
//  OnlineShop
//
//  Created by Игорь Никифоров on 22.01.2025.
//

import Foundation

enum Const {
    enum Title {
        static let products = "Products"
        static let favorites = "Favorites"
        static let cart = "Cart"
        static let total = "Total:"
    }
    enum DB {
        static let path = "shop"
        static let isFavorite = "isFavorite"
        static let quantityInCart = "quantityInCart"
    }
    enum Image {
        static let cart = "cart.fill"
        static let heart = "heart.fill"
        static let remove = "xmark.circle.fill"
        static let decrease = "minus.rectangle.fill"
        static let increase = "plus.rectangle.fill"
        static var chevron = "chevron.left"
    }
    enum Button {
        static let buy = "Buy:"
        static let addToCart = "Add to cart"
    }
}
