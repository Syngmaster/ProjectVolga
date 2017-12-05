//
//  DataManager.swift
//  VolgaFashion
//
//  Created by Syngmaster on 04/12/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

import Foundation

class DataManager {
    
    static var sharedInstance = DataManager()
    
    func downloadCategories(completion: @escaping (Int) -> ()) {
        
        completion(5)
        
    }
    
}
