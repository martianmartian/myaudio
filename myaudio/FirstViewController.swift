//
//  ViewController.swift
//  myaudio
//
//  Created by martian2049 on 8/30/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

// addition is web front only
// removal is mobile only


import UIKit
import AVFoundation

class FirstViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let arr:[String]=["0.png","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]
    
    //var refresher:UIRefreshControl!
    //private let refreshControl = UIRefreshControl()
    
    override func loadView() {
        print("ok, stop loadView(), once---------")
//        Models.removeAllX(entity: "albums")
//        Models.removeAllX(entity: "items")
        Albums.superInit{
            super.loadView()
        }
        Items.superInit{}// this has to be somewhere else to optimize later on.
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        //self.view
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        //print("willDisplay")
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Albums.content.count+1
    }
//    func reloadSections(_ sections: IndexSet, with animation: UITableViewRowAnimation){
//        print("Hoho, a puzzle solved")
//    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let albumCell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumCell", for: indexPath) as! albumCell
        albumCell.albumImage.image = UIImage(named: arr[indexPath.row])
        
        albumCell.isUserInteractionEnabled=true
        let CellTap:UITapGestureRecognizer
        if indexPath.row == 0{
            //Mark: the first addition button
            CellTap = UITapGestureRecognizer(target:self,action:#selector(FirstViewController.prepReq))
        }else{
            //Mark: albums
            CellTap = UITapGestureRecognizer(target:self,action:#selector(FirstViewController.goToView2))
            albumCell.tag = indexPath.row-1
            //albumCell.album = Albums.content[indexPath.row-1]
            //print("\ndisplaying albumCell.album: ", albumCell.album["albumid"] ?? "retrieve failure: collectionView -> cellForItemAt")
        }
        albumCell.addGestureRecognizer(CellTap)
        
        return albumCell
    }
    func goToView2(_ gesture:AnyObject){ //print("go to second view here")
        let v = gesture.view!
        let tag = v.tag
        print("Going to album: \(Albums.content[tag]["albumid"] ?? "Something wrong" as AnyObject)")
        
        let storyBoard = UIStoryboard(name:"Main", bundle:nil)
        let secondVC = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        secondVC.currentAlbum = Albums.content[tag]
        secondVC.currentItems = Items.fetchItemsOfAlbum(albumid: Albums.content[tag]["albumid"] as! String)
        self.present(secondVC, animated: true)
        
    }
    func prepReq(){
        
        let alert = UIAlertController(title: "For Sync", message: "Enter yoru code", preferredStyle: .alert)
        alert.addTextField { (textField) in textField.text = "343"}
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            //Mark: if valid code, request files from server
            guard let code = textField?.text else {print("invalide code");return}
            self.reqFile(obj:["code":code as AnyObject])
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func reqFile(obj:Dictionary<String, AnyObject>){
        
        HttpReq.getFile(obj:obj){data in
            
            Albums.update(data:data["albums"] as! [Dictionary<String, AnyObject>])
            Items.update(data:data["items"] as! [Dictionary<String, AnyObject>])
//            self.reloadSections([1], with: UITableViewRowAnimation.automatic)
        }

    }
    
}

