//
//  Models.swift
//  myaudio
//
//  Created by martian2049 on 9/8/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Models{
    
    static var db = UserDefaults.standard
    
}


extension Models{
    
    static func fetchXById(){
        
        
    }

    static func updateAllXdb(data:[Dictionary<String, AnyObject>],entity:String,ifDup:(_ dic:Dictionary<String, AnyObject>)->Bool){
        // is this synch or asynch????????????
        
        //putting new stuff in.
        var arrOfDic = [Dictionary<String, AnyObject>]()
        for one in data{
            var eachdic = one
            
            if ifDup(one) {print("updateAllXdb got duped \(entity) ---");continue}
            
            eachdic["createdAt"] = NSDate()

            arrOfDic.append(eachdic)
        }
        //print("arrOfDic is being saved, from updateAllXdb",arrOfDic)
        Models.db.set(arrOfDic, forKey:entity)

    }

    static func pluck(data:[Any], key:String)->[String]{
        var arr = [String]()
        if data.count>0{
            for al in data{
                let al = al as AnyObject
                arr.append(al.value(forKey:key) as! String)
            }
        }
        return arr
    }
    
    static func fetchAllXdb(entity:String) -> [Dictionary<String, AnyObject>]{
        
        guard let stuff = Models.db.value(forKey: entity)
            else {print("fetchAllXdb got nill x-x-x"); return [Dictionary<String, AnyObject>]()} // nil if empty
        
        return stuff as! [Dictionary<String, AnyObject>]
    }
    
    static func removeAllX(entity:String){
        // mascer, be carefull.
        
        Models.db.removeObject(forKey:entity)
        print("after removing all \(entity), Models.fetchAllXdb(entity:entity) shows: ", Models.fetchAllXdb(entity:entity))
        
    }

}










