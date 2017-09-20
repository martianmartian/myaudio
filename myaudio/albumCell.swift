//
//  albumCell.swift
//  myaudio
//
//  Created by martian2049 on 9/18/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import UIKit
import AVFoundation

class albumCell: UICollectionViewCell {
    
    
    @IBOutlet weak var albumImage: UIImageView!
    
    @IBOutlet weak var imageLabel: UILabel!
    
    
    var album=Dictionary<String, AnyObject>()
    
}
