//
//  Item.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class Items{
    
    static let entity = "items"
    static let jsonkey = "itemId"
    static var ids=[String]()
    static var content = [Dictionary<String, AnyObject>](){
        didSet{
            Items.ids = Models.pluck(data: Items.content, key:Items.jsonkey)
            print("updated Items ids: ", Items.ids)
        }
    }
    
    static func superInit(completion:()->()){
        guard let stuff = Models.db.value(forKey: Items.entity) else {print("Items.superInit got nil x-x-x"); completion(); return}
        Items.content = stuff as! [Dictionary<String, AnyObject>]
        
        print("superIinted Items: ", Items.content.count)
        completion()
    }
    static func fetchDB() -> [Dictionary<String, AnyObject>]{
        guard let stuff = Models.db.value(forKey: Items.entity) else {print("Items.fetchDB got nil x-x-x"); return []}
        return stuff as! [Dictionary<String, AnyObject>]
    }
    static func update(data:[Dictionary<String, AnyObject>]){
        
        Models.updateAllXdb(data:data, entity: Items.entity){dic in // check for dups
            let dic = dic
            let id = dic[Items.jsonkey] as! String
            return Items.ids.contains(id)
        }
        Items.content = Models.fetchAllXdb(entity:Items.entity)
        
    }
    static func fetchItemsOfAlbum(albumid:String)->[Dictionary<String, AnyObject>]{
        var album = [Dictionary<String,AnyObject>]()
        album = Items.content.filter { (item) -> Bool in
            let theid = item["albumid"] as! String
            return theid == albumid
        }
        return album
    }
    static func downloadOne(item:Dictionary<String,AnyObject>,completion:@escaping (Dictionary<String,AnyObject>)->()){
        var item = item
        HttpReq.getMP3(id: item["itemId"] as! String){localURL in
            item["resourceAddr"] = localURL.absoluteString as AnyObject
            item["newOrNot"]="0" as AnyObject
            print("fetched mp3 files to: \(item["resourceAddr"] ?? "Fucked" as AnyObject)")
            completion(item)
        }
    }
    static func downloadAllNew(items:[Dictionary<String,AnyObject>]){
        var items = items
        for (i,item) in items.enumerated(){
            var item = item
            if item["newOrNot"] as! String == "0" {return}
            Items.downloadOne(item: item){newItem in
                items[i] = newItem
                Items.update(data: items)
                print("\ndownloaded mp3 for item \(item["itemName"] ?? "Error" as AnyObject)")
                print(newItem["resourceAddr"] as! String)
            }
        }
    }

    
}






