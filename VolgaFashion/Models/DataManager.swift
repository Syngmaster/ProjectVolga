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
    
}
