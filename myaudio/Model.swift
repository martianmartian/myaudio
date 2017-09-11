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
    static let dic = ["Album":"albums","Item":"items"] //needs update
    static let Entities = Array(dic.keys)
    static let Keys = Array(dic.values)
    
    static func updateAll(data: AnyObject){
        print("updateAll() called after data was acquired")

        for entity in Entities{
            print(data[dic[entity]!] as! [Any])
        }
        //Albums.content = data?["albums"] as! [Any]
        //Items.content = data?["items"] as! [Any]
        //var what="sfsfs"
    }
    
    static func newEntity(entity:String, addContents:@escaping (_ : Any)->()){
        // takes in a closure, which exposes the created new entity.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard Entities.contains(entity) else {return}
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: entity, into: context)
        
        addContents(newEntity) // closure callback
        
        do{try context.save();print("saved")}
        catch{print(error)}
    }
    
    static func updateEntity(category:String){
        // mobile side only removes content, no need for "new album" etc.
        // instead always update these data is easier.
    }
    
    static func removeXofEntity(){
        //context.delete(<#T##object: NSManagedObject##NSManagedObject#>)
    }
    
    static func removeAll(){
        // mascer, be carefull.
        //Models.removeAll()
        //print(Models.fetchAllX(entity:"Album"))
        //print(Models.fetchAllX(entity:"Item"))

        for entity in Entities{
            let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            do
            {
                try context.execute(deleteRequest)
                try context.save()
            }
            catch
            {
                print ("There was an error")
            }
        }
    }
    static func fetchItemById(){
        
        
    }

    static func fetchAllX(entity:String)->Array<Any>{
        // Fetch all that belongs to type X
        
        var results=[Any]()
        // guard X type to be string of existing type names
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:entity)
        request.returnsObjectsAsFaults=false
        do{
            results = try context.fetch(request)
            print("found ",results.count, entity)
            
            //            if results.count>0{
            //                for result in results as! [NSManagedObject] {
            //                    if let name = result.value(forKey: "name"){
            //                        albumNames.append(name as! String)
            //                        print(name)
            //                    }
            //                    if let id = result.value(forKey: "id"){
            //                        albumIds.append(id as! String)
            //                        print(id)
            //                    }
            //                }
            //                print(albumNames)
            //                print(albumIds)
            //            }
        }
        catch{}
        return results
    }
}


