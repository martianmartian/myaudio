//
//  Album.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class Albums{
    static var content = [Any]()
    
    static func createAlbum(albumname:String,albumid:String){
        Models.newEntity(entity: "Album"){ newAlbum in
            //print("here's the callback passed into the newEntity")
            
            let newAlbum = newAlbum as AnyObject
            
            newAlbum.setValue(albumname, forKey: "albumname")
            newAlbum.setValue(Util.randomString(length: 10),forKey:"albumid")
            newAlbum.setValue(Date(), forKey: "createdAt")
            newAlbum.setValue(1, forKey: "priority")
            newAlbum.setValue(0, forKey: "numItems")
            newAlbum.setValue("", forKey: "imgurl")
            
        }
        
    }
    static func updateAlbums(){
        
    }
}
