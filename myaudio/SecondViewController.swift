//
//  SecondViewController.swift
//  myaudio
//
//  Created by martian2049 on 9/18/17.
//  Copyright © 2017 martian2049. All rights reserved.
//


import UIKit

class SecondViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let arr=["1","2","3","4","5"]
    let indexArr = ["A","B","C","D","E"]
    
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
        print("once")
        //let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier:"itemCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! itemCell
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(arr[indexPath.row])
        
    }
    
    
}

