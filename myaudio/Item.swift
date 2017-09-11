//
//  Item.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class Items{
    static var content = [Any]()
    
    static func createItem(itemname:String,itemid:String){
        Models.newEntity(entity: "Item"){ newItem in
            print("item being created")
        }
        
    }
}
