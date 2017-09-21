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
        //print(cell.tag)
        cell.isUserInteractionEnabled=true
        let cellTap:UITapGestureRecognizer
        cellTap = UITapGestureRecognizer(target:self,action:#selector(SecondViewController.selectedItem))
        cell.addGestureRecognizer(cellTap)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("current item is at: \(Models.currentItems[indexPath.row]["itemId"] ?? "Something wrong" as AnyObject)")
    }
    @objc func selectedItem(_ gesture:AnyObject){
        let v = gesture.view!
        let tag = v.tag
        let tapped=Models.currentItems[tag]
        Models.selectedItem(tapped:tapped)
    }
    
    
    @IBAction func tapGoRightButton(_ sender: UIButton) {
        Models.goNextItem()
    }
    @IBAction func tapGoLeftButton(_ sender: UIButton) {
        Models.goPrevItem()
    }
    @IBAction func tapPlayButton(_ sender: UIButton) {
        Models.tapPlayButton()
    }
    
}

