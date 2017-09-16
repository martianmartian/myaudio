//
//  ViewController.swift
//  myaudio
//
//  Created by martian2049 on 8/30/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    // addition is web front only
    // removal is mobile only
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
//        var player: AVAudioPlayer = AVAudioPlayer() // should be persistent
//        //===================================================================
//        // For access the downloaded file and again play.
//        let documentsDirectoryURL2 =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        
//        let audioUrl = URL(string:"file:///Users/martian2049/Library/Developer/CoreSimulator/Devices/F530E61C-0EE4-4CD4-AF55-14066C02CD9F/data/Containers/Data/Application/728F82C3-A05F-4C5C-990D-DAB83B1153D1/Documents/57d331f9-1820-a982-1674-a513a3193249.mp3" )
//        let destinationUrl2 = documentsDirectoryURL2.appendingPathComponent((audioUrl?.lastPathComponent)!)
//        
//        do {
//            player = try AVAudioPlayer(contentsOf: destinationUrl2)
//            player.prepareToPlay()
//            player.play()
//        } catch let error {
//            print("------------")
//            print(error.localizedDescription)
//        }

        
//        
        Models.removeAllX(entity: "albums")
        Models.removeAllX(entity: "items")

        HttpReq.getFile(obj:["code":"343" as AnyObject]){data in
            //Albums.shared.updateAll(data: data["albums"] as! [AnyObject])
            Items.shared.updateAll(data:data["items"] as! [AnyObject])

        }
        
    }
    



}

