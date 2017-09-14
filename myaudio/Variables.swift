//
//  Variables.swift
//  myaudio
//
//  Created by martian2049 on 9/12/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation
import UIKit


//struct MP3x{
//    //Warning: do NOT pass instance around.
//    //unexpected behavior will happen.
//    var modeldic = ["":""] //needs update
//    var Entities = [""]
//
//    
//    var context:AnyObject
//    
//    init(){
//        print("MP3 called--------")
//        //Mark: model types
//        self.modeldic = ["Album":"albums","Item":"items"]
//        //Mark: Entity name collections
//        self.Entities = Array(modeldic.keys)
//
//        
//        //Mark: Core Data Context
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        self.context = appDelegate.persistentContainer.viewContext
//
//    }
//}
//
// MARK: - Singleton
final class MP3 {
    //Warning: do NOT pass instance around.
    //unexpected behavior will happen.
    var modeldic = ["":""] //needs update
    var Entities = [""]
    
    
    var context:AnyObject
    
    init() {
        print("MP3 called--------")
        //Mark: model types
        self.modeldic = ["Album":"albums","Item":"items"]
        //Mark: Entity name collections
        self.Entities = Array(modeldic.keys)
        
        
        //Mark: Core Data Context
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        self.context = appDelegate.persistentContainer.viewContext

    }
    
    // MARK: Shared Instance
    static let shared = MP3()
    
}



