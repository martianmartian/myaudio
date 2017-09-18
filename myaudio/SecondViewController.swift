//
//  SecondViewController.swift
//  myaudio
//
//  Created by martian2049 on 9/18/17.
//  Copyright © 2017 martian2049. All rights reserved.
//


import UIKit
import AVFoundation

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let arr=["1","2","3","4","5"]
    let indexArr = ["A","B","C","D","E"]
    var currentAlbum = "raw---------"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return indexArr[section]
    }
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArr
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //print("once")
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"itemCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! itemCell
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arr[indexPath.row])
        print("current album is at: \(self.currentAlbum)")
        
    }
    
    
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
    
    

    
}

