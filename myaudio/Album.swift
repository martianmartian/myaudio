//
//  Album.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class Albums{
    var content = [Any]()
    var entity="albums"
    var jsonkey = "albumid"
    var ids=[String]()
    
    init(){
        content = Models.fetchAllXdb(entity:entity)
        ids = Models.pluck(data: content, key:jsonkey)
    }
    static var shared = Albums()

    func updateAll(data:[AnyObject]){
        
        Models.updateAllXdb(data:data, entity:entity){dic in // check for dups
            let dic = dic as! NSDictionary
            let id = dic[jsonkey] as! String
            return ids.contains(id)
        }
    }


}
