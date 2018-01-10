//
//  DataManager.swift
//  VolgaFashion
//
//  Created by Syngmaster on 04/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage


class DataManager {
    
    static var sharedInstance = DataManager()
    
    func downloadCategories(completion: @escaping (Array<Any>) -> ()) {
        
        let db = FIRDatabase.database().reference()
        db.observe(.value) { (result) in
            
            let resultDict = result.value as! NSDictionary
            let valueDict = resultDict.value(forKey: "Subcategory") as! NSDictionary
            let resultArray = valueDict.allValues
            
            var newArray = [Category]()
            for dict in resultArray {
                let dict = dict as! NSDictionary
                let category = Category.init(photo: dict.value(forKey: "photo") as! String, title: dict.value(forKey: "title") as! String)
                newArray.append(category)

            }
            completion(newArray)
        }
    }
    
    func downloadItems(category: String, subcategory: String, completion: @escaping (Array<Any>) -> ()) {
        
        let db = FIRDatabase.database().reference()
        db.observe(.value) { (result) in
            let resultDict = result.value as! NSDictionary
            let valueDict = resultDict.value(forKey: "\(category)") as! NSDictionary
            let itemsDict = valueDict.value(forKey: "Items") as! NSDictionary
            let resultArray = itemsDict.allValues
            
            var newArray = [ItemModel]()
            for dict in resultArray {
                let dict = dict as! NSDictionary
                if (dict.value(forKey: "subcategory") as! String == subcategory) {
                    let item = ItemModel.init(dict: dict)
                    newArray.append(item)
                }
            }
            completion(newArray)
        }
    }
    
}
