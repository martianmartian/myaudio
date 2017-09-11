//
//  util.swift
//  myaudio
//
//  Created by martian2049 on 9/1/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation


class Util{
    static func help(){
        print("Util.randomString(5)")
    }
    
    static func randomString(length: Int) -> String {
        
        let letters : NSString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len = UInt32(letters.length)
        
        var final=""
        
        func getNewString()->String{
            var randomString = ""
            for _ in 0 ..< length {
                let rand = arc4random_uniform(len)
                var nextChar = letters.character(at: Int(rand))
                randomString += NSString(characters: &nextChar, length: 1) as String
            }
            return randomString
        }
        
//        final = getNewString()
//        while !(Albums.content.index(of: final)==nil && Albums.content.index(of: final)==nil){
//            final = getNewString()
//        }
        
        return final
        
    }

}
