//
//  Album.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation


class Albums{
    
    static let entity = "albums"
    static let jsonkey = "albumid"
    static var ids=[String]()
    static var content = [Dictionary<String, AnyObject>](){
        didSet{
            Albums.ids = Models.pluck(data: Albums.content, key:Albums.jsonkey)
            print("updated Albums ids: ", Albums.ids)
        }
    }
    
    static func superInit(completion:()->()){
        guard let stuff = Models.db.value(forKey: Albums.entity) else { print("Albums.superInit went wrong x-x-x"); completion(); return}
        Albums.content = stuff as! [Dictionary<String, AnyObject>]
        
        print("superIinted Albums: ", Albums.content.count)
        completion()
    }
    static func fetchDB() -> [Dictionary<String, AnyObject>]{
        guard let stuff = Models.db.value(forKey: Albums.entity) else {print("Albums.fetchDB error x-x-x"); return []}
        return stuff as! [Dictionary<String, AnyObject>]
    }
    static func update(data:[Dictionary<String, AnyObject>]){
        
        Albums.content = data
        print("updating albums, current ids are: ", Albums.ids)
        
        Models.updateAllXdb(data:data, entity:Albums.entity){dic in // check for dups
            let dic = dic
            let id = dic[Albums.jsonkey] as! String
            print("checking ids: ", id)
            return Albums.ids.contains(id)
        }
        
    }
    
}



