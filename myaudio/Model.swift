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
    
    static func newEntityIntoCoreData(entity:String, addContents:@escaping (_ : Any)->()){
        // takes in a closure, which exposes the created new entity.
        
        guard mp3.Entities.contains(entity) else {return}
        let newEntity = NSEntityDescription.insertNewObject(forEntityName: entity, into: mp3.context as! NSManagedObjectContext)
        
        addContents(newEntity) // closure callback
        
        do{try mp3.context.save();print("saved")}
        catch{print(error)}
    }
    
    static func updateEntity(category:String){
        // mobile side only removes content, no need for "new album" etc.
        // instead always update these data is easier.
    }
    
    static func removeXofEntity(){
        //context.delete(<#T##object: NSManagedObject##NSManagedObject#>)
    }
    

    static func fetchItemById(){
        
        
    }


    
}


extension Models{
    static func fetchAllX(entity:String) -> Array<Any>{
        // Fetch all that belongs to type X
        
        var results=[Any]()
        
        if mp3.Entities.contains(entity)==false{return []}
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:entity)
        request.returnsObjectsAsFaults=false
        
        do{
            results = try mp3.context.fetch(request)
            print("found ",results.count, entity)
        }catch{}
        
        return results
    }
    static func removeAll(){
        // mascer, be carefull.
        //Models.removeAll()
        for entity in mp3.Entities{
            let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: entity)
            let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
            do
            {
                let _ = try mp3.context.execute(deleteRequest)
                try mp3.context.save()
            }
            catch
            {
                print ("There was an error")
            }
        }
        print(fetchAllX(entity:"Album"))
    }

}










