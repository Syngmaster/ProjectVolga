//
//  ItemModel.swift
//  VolgaFashion
//
//  Created by Syngmaster on 10/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import Foundation

class ItemModel {
    
    var itemName: String!
    var itemPrice: Int!
    var itemDescription: String!
    var isOnSale: Bool!
    var isWishlisted: Bool!
    var isInBasket: Bool!
    var subcategory: String!
    var photoArray:[String]!
    
    init(dict:NSDictionary) {
        isWishlisted = false
        isInBasket = false
        isOnSale = false
        itemPrice = dict.value(forKey: "price") as! Int
        itemName = dict.value(forKey: "itemName") as! String
        itemDescription = dict.value(forKey: "description") as! String
        
        let newArray = dict.value(forKey: "photos") as! NSDictionary
        photoArray = newArray.allValues as! [String]
        
    }
    
    
}
