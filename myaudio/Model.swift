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
import AVFoundation

class Models{
    
    static var db = UserDefaults.standard
    static var player: AVAudioPlayer = AVAudioPlayer() // should persist
    
    static var currentAlbum=Dictionary<String, AnyObject>()
    static var currentItems=[Dictionary<String, AnyObject>]()
    static var currentPlaying=Dictionary<String, AnyObject>()
    static var currentPlayingIndex = 0{
        didSet{
            if Models.currentItems.count != 0 {Models.currentPlaying = Models.currentItems[Models.currentPlayingIndex]}
            
        }
    }
    
}

extension Models{
    //Basic play control
    
    static func currentPlayingGO(){
        print("ready to play \(Models.currentPlaying["resourceAddr"] ?? "Mistake" as AnyObject)")
        
        let documentsDirectoryURL2 =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let audioUrl = URL(string: Models.currentPlaying["resourceAddr"] as! String)
        let destinationUrl2 = documentsDirectoryURL2.appendingPathComponent((audioUrl?.lastPathComponent)!)
        
        do {
            Models.player = try AVAudioPlayer(contentsOf: destinationUrl2)
            Models.player.prepareToPlay()
            Models.player.play()
        } catch let error {
            print("------------")
            print(error.localizedDescription)
        }
    }
    static func togglePlay(){
        //print("Paused \(Models.currentPlaying["resourceAddr"] ?? "Mistake" as AnyObject)")
        if Models.player.isPlaying{
            print("Pause---------")
            Models.player.pause()
        }else{
            print("Pause->Play---------")
            Models.player.play()
        }
    }
}

extension Models{
    //Higher level play control
    static func goNextItem(){
        if Models.currentItems.count==0 {print("tapGoRightButton, but no items"); return}
        //Models.currentItems.next(<#T##index: Int##Int#>)
    }
    static func goPrevItem(){
        if Models.currentItems.count==0 {print("tapGoLeftButton, but no items"); return}
        
    }
    static func tapPlayButton(){
        if Models.currentItems.count==0 {print("tapPlayButton, but no items"); return}
        
        if Models.currentPlaying["itemId"] == nil{
            print("nil to begin with---------")
            Models.currentPlaying = Models.currentItems[0]
            Models.currentPlayingGO()
        }else {
            Models.togglePlay()
        }
    }
    static func selectedItem(tapped:Dictionary<String, AnyObject>){
        if Models.currentPlaying["itemId"] == nil{
            print("nil to begin with---------")
            Models.currentPlaying = tapped
            Models.currentPlayingGO()
        }else if Models.currentPlaying["itemId"] as! String == tapped["itemId"] as! String{
            Models.togglePlay()
        }
        else{
            print("startin a new item ---------")
            Models.togglePlay()
            Models.currentPlaying = tapped
            Models.currentPlayingGO()
        }
    }

}

extension Models{
    // Model data methods
    static func fetchXById(){}

    static func updateAllXdb(data:[Dictionary<String, AnyObject>],entity:String,ifDup:(_ dic:Dictionary<String, AnyObject>)->Bool){
        // is this synch or asynch????????????
        
        //putting new stuff in.
        var arrOfDic = [Dictionary<String, AnyObject>]()
        for one in data{
            var eachdic = one
            
            if ifDup(one) {print("updateAllXdb got duped \(entity) ---");continue}
            
            eachdic["createdAt"] = NSDate()

            arrOfDic.append(eachdic)
        }
        //print("arrOfDic is being saved, from updateAllXdb",arrOfDic)
        Models.db.set(arrOfDic, forKey:entity)

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
    
    static func fetchAllXdb(entity:String) -> [Dictionary<String, AnyObject>]{
        
        guard let stuff = Models.db.value(forKey: entity)
            else {print("fetchAllXdb got nill x-x-x"); return [Dictionary<String, AnyObject>]()} // nil if empty
        
        return stuff as! [Dictionary<String, AnyObject>]
    }
    
    static func removeAllX(entity:String){
        // mascer, be carefull.
//        add removing of mp3 files here
        Models.db.removeObject(forKey:entity)
        print("after removing all \(entity), Models.fetchAllXdb(entity:entity) shows: ", Models.fetchAllXdb(entity:entity))
    }
    static func removeOneMP3(addr:String){
        
        
    }

}










