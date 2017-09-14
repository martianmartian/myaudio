//
//  Album.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class Albums:Models{
    var content = [Any]()
    var name="Album"
    var albumIds=[String]()
    
    override init(){
        print("content is here-=-----------")
//        content = Models.fetchAllX(entity:name)
//        for al in content{
//            let al = al as AnyObject
//            albumIds.append(al.value(forKey:"albumid") as! String)
//        }
        
    }

    func updateAll(data:[AnyObject]){
//        for one in data{
//            let key = one.value(forKey: "albumid") as! String
//            if albumIds.contains(key) {return}
//            
//            Models.newEntityIntoCoreData(entity:name){newAlbum in
//                let newAlbum = newAlbum as AnyObject
//                
//                newAlbum.setValue(one["albumid"] as! String, forKey: "albumid")
//                newAlbum.setValue(one["albumname"] as! String, forKey: "albumname")
//                newAlbum.setValue(NSDate(), forKey: "createdAt")
//                print("new one here: \(key)")
//                print(newAlbum)
//            }
//        }
    }


}
