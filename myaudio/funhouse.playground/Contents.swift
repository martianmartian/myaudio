//: Playground - noun: a place where people can play


import Foundation


let savedData = ["Something": 1]

let jsonObject: [String: Any] = [
    "type_id": 1,
    "model_id": 1,
    "transfer": [
        "startDate": "10/04/2015 12:45",
        "endDate": "10/04/2015 16:00"
    ],
    "custom": savedData
]

let valid = JSONSerialization.isValidJSONObject(jsonObject) // true
type(of: jsonObject["type_id"] as! Int)
var wtf = jsonObject["transfer"] as! [String:String]
print(wtf)
print(type(of: wtf))



