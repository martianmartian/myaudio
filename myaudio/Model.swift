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
    
    var Keys:[String]=[] //needs update
    var db:AnyObject
    
    init(){
        Keys = ["albums", "items"]
        db = UserDefaults.standard
    }
    static let shared = Models()
    
    static func fetchXById(){
        
        
    }
    
}


extension Models{
    
    static func updateAllX(data:[AnyObject],entity:String,ifDup:(_ dic:AnyObject)->Bool){
        
        //putting new stuff in.
        var arrOfDic = [AnyObject]()
        for one in data{
            var eachdic = [String:AnyObject]()
            
            //check for duplicates
            if ifDup(one as AnyObject) {continue}
            
            for (key, val) in one as! NSDictionary{
                if type(of: val) == NSNull.self {continue}
                eachdic[key as! String] = val as AnyObject
            }
            eachdic["createdAt"] = NSDate()
            
            arrOfDic.append(eachdic as AnyObject)
        }
        //print(arr)
        Models.shared.db.set(arrOfDic, forKey:entity)
        //print(Models.fetchAllX(entity: entity) as [AnyObject])
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
    
    static func fetchAllX(entity:String) -> Array<Any>{
        // Fetch all that belongs to type X
        if Models.shared.Keys.contains(entity)==false{return []}
        
        guard let stuff = Models.shared.db.value(forKey: entity) else { return []} // nil if empty
        
        return stuff as! [AnyObject]
    }
    
    static func removeAllX(entity:String){
        // mascer, be carefull.
        if Models.shared.Keys.contains(entity)==false{return}
        
        Models.shared.db.removeObject(forKey:entity)
        
        print(fetchAllX(entity:entity))
    }

}










