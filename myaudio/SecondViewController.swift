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
    
    @IBOutlet weak var tableView: UITableView!
    @IBAction func swipeToFirst(_ sender: UISwipeGestureRecognizer){}
    
    override func loadView() {
        super.loadView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.alwaysBounceVertical = false
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Models.currentItems.count
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! itemCell
        cell.itemCell.text = Models.currentItems[indexPath.row]["itemName"] as? String
        cell.tag = indexPath.row
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("current item is at: \(Models.currentItems[indexPath.row]["itemId"] ?? "Something wrong" as AnyObject)")
        
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

