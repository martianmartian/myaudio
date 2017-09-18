//
//  ViewController.swift
//  myaudio
//
//  Created by martian2049 on 8/30/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import UIKit
import AVFoundation

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // addition is web front only
    // removal is mobile only
    
    let arr:[String]=["0.png","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]
    
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

        
        
//        Models.removeAllX(entity: "albums")
//        Models.removeAllX(entity: "items")

        
//        HttpReq.getFile(obj:["code":"343" as AnyObject]){data in  // is this synch or asynch????????????
//            
//            //Albums.shared.updateAll(data: data["albums"] as! [AnyObject])
//            Items.shared.updateAll(data:data["items"] as! [AnyObject])
//            
//            print("Items.shared.content",Items.shared.content)//is xcode creating a new app at root every time ran?
//            
//        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! albumCell
        cell.albumImage.image = UIImage(named:arr[indexPath.row])
        
        cell.isUserInteractionEnabled=true
        let ImageTap = UITapGestureRecognizer(target:self,action:#selector(FirstViewController.goToView2))
        cell.addGestureRecognizer(ImageTap)
        
        return cell
    }
    func goToView2(_ sender:AnyObject){
        //print("go to second view here")
        //print(sender)
        //<UITapGestureRecognizer: 0x146b0e30; state = Ended; view = <myaudio.albumCell 0x146ae1f0>; target= <(action=goToView2:, target=<myaudio.FirstViewController 0x145cff70>)>>
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.present(secondVC, animated: true)
        
    }
    



}

