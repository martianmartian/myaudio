//
//  http.swift
//  myaudio
//
//  Created by martian2049 on 9/3/17.
//  Copyright © 2017 martian2049. All rights reserved.
//

import Foundation

class HttpReq{

    static func getFile(obj:[String:AnyObject],then:@escaping (AnyObject)->()){
        let config=[
            "root":"http://localhost:8080/query_file",
            "method":"GET",
            "params":obj
            ] as [String : AnyObject]
        
        let request = URLRequest.config(config:config as [String : AnyObject])
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {(data,res,err)-> Void in
            if err != nil{return}
            do {
                let result = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: AnyObject]
                then(result as AnyObject)
            }catch{print("Error -> \(error)")}
            
        }).resume()
        
    }


    static func postit(obj:[String:AnyObject]){
        
        let audioUrl = URL(string: "http://localhost:8080/test")
        var request = URLRequest(url:audioUrl!)
        request.httpMethod = "POST"
        request.httpBody = try! JSONSerialization.data(withJSONObject: obj, options: [])
        
        let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler:{(data,res,err)->Void in
            if err != nil{return}
            do {
                guard let data = data else { return }
                guard let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String: AnyObject] else { return }
                print("json:", result)
                
                let datastring = result["a"] as! String
                print(datastring)
                
            }catch{print("Error -> \(error)")}
            
            //print(res as Any)
            
        })
        task.resume()

    }
    
}
