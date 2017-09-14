//
//  Item.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class Items:Models{
    var content = [Any]()
    var name="Item"
    var itemIds = [String]()
    
    override init(){
        content = Models.fetchAllX(entity:name)
//        for it in content{
//            let it = it as AnyObject
//            itemIds.append(it.value(forKey:"itemId") as! String)
//        }
//        print(itemIds)
        
    }
    
    func updateAll(data:[AnyObject]){
//        for one in data{
//            let key = one.value(forKey: "itemId") as! String
//            if itemIds.contains(key) {return}
//            
//            Models.newEntityIntoCoreData(entity:name){newItem in
//                let newItem = newItem as AnyObject
//                
//                newItem.setValue(one["itemId"] as! String, forKey: "itemId")
//                newItem.setValue(one["itemName"] as! String, forKey: "itemName")
//                newItem.setValue(NSDate(), forKey: "createdAt")
//                print("new one here: \(key)")
//                print(newItem)
//            }
//        }
    }

}
