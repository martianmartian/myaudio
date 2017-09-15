//
//  ViewController.swift
//  myaudio
//
//  Created by martian2049 on 8/30/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // addition is web front only
    // removal is mobile only
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        //Models.removeAllX(entity: "albums")
        HttpReq.getFile(obj:["code":"542" as AnyObject]){data in
            
            Albums.shared.updateAll(data: data["albums"] as! [AnyObject])
            Items.shared.updateAll(data:data["items"] as! [AnyObject])

        }
        
    }
    



}

