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
    
    var albums = Albums()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        print("first load self.albums.content: \(self.albums.content)")
        
//        Models.removeAllX(entity: "albums")
//        Models.removeAllX(entity: "items")


    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! albumCell
        cell.albumImage.image = UIImage(named:arr[indexPath.row])
        //cell.tag = indexPath.row
        
        cell.isUserInteractionEnabled=true
        let ImageTap:UITapGestureRecognizer
        if indexPath.row == 0{
            ImageTap = UITapGestureRecognizer(target:self,action:#selector(FirstViewController.prepReq))
        }else{
            ImageTap = UITapGestureRecognizer(target:self,action:#selector(FirstViewController.goToView2))
        }
        cell.addGestureRecognizer(ImageTap)
        
        return cell
    }
    func goToView2(_ sender:AnyObject){ //print("go to second view here")
        //print(sender)
        //<UITapGestureRecognizer: 0x146b0e30; state = Ended; view = <myaudio.albumCell 0x146ae1f0>; target= <(action=goToView2:, target=<myaudio.FirstViewController 0x145cff70>)>>
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        //secondVC.currentAlbum = String(sender.tag)
        self.present(secondVC, animated: true)
        
    }
    func prepReq(){
        
        let alert = UIAlertController(title: "For Sync", message: "Enter yoru code", preferredStyle: .alert)
        alert.addTextField { (textField) in textField.text = "343"}
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            print("Got code: \(textField?.text ?? "is invalid!!")")
            
            //Mark: if valid code, request files from server
            guard let code = textField?.text else {return}
            self.reqFile(obj:["code":code as AnyObject])
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func reqFile(obj:Dictionary<String, AnyObject>){
        
        HttpReq.getFile(obj:["code":"343" as AnyObject]){data in  // is this synch or asynch????????????
            self.albums.updateAll(data:data["albums"] as! [AnyObject])
            //Albums.shared.updateAll(data: data["albums"] as! [AnyObject])
            //Items.shared.updateAll(data:data["items"] as! [AnyObject])
            //print("Items.shared.content",Items.shared.content)//is xcode creating a new app at root every time ran?
        }

    }
    
}

