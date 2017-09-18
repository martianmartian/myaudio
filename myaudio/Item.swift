//
//  Item.swift
//  myaudio
//
//  Created by martian2049 on 9/11/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class Items{
    
    var entity="items"
    var jsonkey = "itemId"
    var ids=[String]()

    var content = [Dictionary<String, AnyObject>](){
        didSet{
            print("hoho----")
            //Part1: save json files in userdefault //when inited, this part won't be triggered
            Models.updateAllXdb(data:content as [AnyObject], entity:entity){dic in // check for dups
                let dic = dic as! NSDictionary
                let id = dic[jsonkey] as! String
                return ids.contains(id)
            }

            //Par2: update ids
            ids = Models.pluck(data: content, key:jsonkey)
            
            //Part3:  update view if controller used
                //conditional on whether the view has anything changed, or if just database saving
        }
    }
    
    init(){
        content = Models.fetchAllXdb(entity: entity)

    }
    static var shared = Items()
    
    func updateAll(data:[AnyObject]){

        //Part1: synch with class content
        content = data as! [Dictionary<String, AnyObject>]
        // pre-download synch
        //print(content)

        for (i,item) in content.enumerated(){
            var each = item
            let ifNew = each["newOrNot"] as! String
            if ifNew == "0" {return}
            HttpReq.getMP3(id: each["itemId"] as! String){localURL in
                each["resourceAddr"] = localURL.absoluteString as AnyObject
                each["newOrNot"]="0" as AnyObject
                self.content[i] = each
                
                // potentially failed setting net contents. be aware
//                print(self.content[i])
//                print("----------=-=-=-")
//                print(self.content[i])
//                print("=-=-=-----------")
//                print(self.content)
            }
        }

    }
    

}






