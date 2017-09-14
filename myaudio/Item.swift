//
//  Item.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class Items{
    var content = [Any]()
    var entity="items"
    var jsonkey = "itemId"
    var ids=[String]()
    
    init(){
        content = Models.fetchAllX(entity:entity)
        ids = Models.pluck(data: content, key:jsonkey)
    }
    static var shared = Items()
    


}
