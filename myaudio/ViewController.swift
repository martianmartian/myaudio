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
        
        //print(Models.fetchAllX(entity:"Album"))
        //print(Models.fetchAllX(entity:"Item"))
        
        HttpReq.getFile(obj:["code":"825" as AnyObject]){data in
            Models.updateAll(data:data)
            
        }
        //Albums.createAlbum(albumname:"dodo",albumid: "wlekwrjweklr")
        
        
    }
    



}

