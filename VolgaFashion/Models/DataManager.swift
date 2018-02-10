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
    
    func downloadSubCategories(category: String, completion: @escaping (Array<Any>) -> ()) {
        
        let db = FIRDatabase.database().reference()
        db.observe(.value) { (result) in
            
            guard let resultDict = result.value as? NSDictionary,
            let valueDict = resultDict.value(forKey: "\(category)") as? NSDictionary,
                let itemsDict = valueDict.value(forKey: "Subcategory") as? NSDictionary
                else { completion([]); return }
                    
            var newArray = [Category]()
            
            for dict in itemsDict {
                let dict = dict.value as! NSDictionary
                let category = Category.init(photo: dict.value(forKey: "photo") as! String, title: dict.value(forKey: "title") as! String)
                newArray.append(category)
            }

            completion(newArray)
        }
    }
    
    func downloadItems(category: String, subcategory: String, completion: @escaping (Array<Any>) -> ()) {
        
        let db = FIRDatabase.database().reference()
        
        if category != subcategory {
            db.child(category).child("Subcategory").child(subcategory).child("Items").observe(.value) {(result) in
                
                if let resultDict = result.value as? NSDictionary {
                    var newArray = [ItemModel]()
                    for dict in resultDict {
                        let dict = dict.value as! NSDictionary
                        let item = ItemModel.init(dict: dict)
                        newArray.append(item)
                    }
                    completion(newArray)
                } else {
                    completion([])
                }
                
            }
            
        } else {
            db.child(category).child("Subcategory").child(subcategory).child("Items").observe(.value) {(result) in
                
                if let resultDict = result.value as? NSDictionary {
                    var newArray = [ItemModel]()
                    for dict in resultDict {
                        let dict = dict.value as! NSDictionary
                        let item = ItemModel.init(dict: dict)
                        newArray.append(item)
                    }
                    completion(newArray)
                } else {
                    completion([])
                }
                
            }
        }
        

    }
    
}
