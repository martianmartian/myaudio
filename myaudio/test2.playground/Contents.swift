//: Playground - noun: a place where people can play

import Foundation
//closure related


//let arr = [6,3,8,4]
//
//// approach 1: 
////last arg?
////shorthand argument names
////return implied
//let arr2 = arr.sorted{$0<$1}
//print(arr2)
////return explictly
//let arr22 = arr.sorted{
//    return $0<$1
//}
//print(arr22)
//
//// approach 2
//func ssit(one:Int, two:Int) -> Bool {
//    return one>two
//}
//let arr3 = arr.sorted(by: ssit)
//
////approach 3
//let arr4 = arr.sorted(by:{$0<$1})
//print(arr4)
//
//
//////apporach 4
////let arr5 = arr.sorted(by: <)
////print(arr5)




//
//func capitalize(_ s:String) -> String {
//    return s.capitalized
//}
//capitalize("hello") // "Hello"
//
//func applyToString(_ s:String, _ f:(String)->String) -> String {
//    return f(s)
//}
//applyToString("hello", capitalize) // "Hello"
//
//["a", "b", "c"].map(capitalize) // ["A", "B", "C"]
//
//
//
//
//
////closure re-cap practice
//let nums = [1, 3, 5, 7]
//
//func doubler(x:Int) -> Int{
//    return(x * 2)
//}
//
//let doubled1 = nums.map(doubler) // [2, 6, 10, 14]
//nums.map{$0*2}
//let double2 = nums.map{
//    return $0*2
//}
//
//func double(_ d:Int)->Int{
//    return d*2
//}
//let double3 = nums.map(double)
//
//var doublef = {
//    (_ d:Int)->Int in
//    return d*2
//}
//// explicitly define the type of closure function
//var doublefTyped:(Int)->(Int) = {
//    (_ d:Int)->Int in
//    return d*2
//}
//
//let double4 = nums.map(doublef)
//
//let double5 = nums.map{(d:Int)->Int in
//    return d*2
//}
//
//let double6 = nums.map({(d:Int)->Int in
//    return d*2
//})
//
//let double7 = nums.map({num in num*2})
//var doublef2 = {num in num*2}
//let dboule77 = nums.map(doublef2)
//
//
////trailing closure
//let double8 = nums.map(){num in num*2}
//let double10 = nums.map{num in num*2}
//
////let double9 = nums.map()doublef          // doesn't work
//let double9 = nums.map(){
//    (_ d:Int)->Int in
//    return d*2
//}


////Classic closure
//func makeMulti(_ by:Int) -> (Int)->Int{
//    
//    func multi(_ dig:Int)->Int{
//        return dig*by
//    }
//    return multi
//    
//}
//
//var multit1 = makeMulti(10)
//var multit2 = makeMulti(2)
//
//print(multit1(3))
//print(multit2(3))



//var numbers = [1, 4, 2, 5, 8, 3]
//
//func sum(from: Int, to: Int, f: (Int) -> (Int)) -> Int {
//    var sum = 0
//    for i in from...to {
//        sum += f(i)
//    }
//    return sum
//}
//
//var va1 = sum(from: 1, to: 10) {
//    $0
//} // the sum of the first 10 numbers
//
//var va2 = sum(from: 1, to: 10) {
//    $0 * 2
//} // the sum of the first 10 squares
//
//print(va1,va2)


//before closures are created, they capture vals from parent scope
//func closureLog(_ level:String) -> (String)->String{
//
//    // level is available for bugClosure at all times
//    var bugClosure = {
//        (_ bug: String)->String in
//            let message = level + " : " + bug
//            print(message)
//            return message
//    }
//    return bugClosure
//}
//
//var warn = closureLog("waning: ")
//warn("something wrong")
//var alert = closureLog("alert: ")
//alert("Medical required")


////after closures are created, they are reference types
////what??????????/ didn't get it
//var closureDouble = {
//    (_ d:Int)->Int in
//    var checker = 10
//    checker *= d
//    print(checker)
//    return d*2
//}
//
//print(closureDouble(2))
//print(closureDouble(1))


//here's the asynch

//// In the async side...
//func someAsyncFunction(completion: @escaping (Error?) -> Void) {
//    // Something that takes some time to complete.
//    print("0")
//    completion(nil) // Or completion(SomeError.veryBadError)
//    print("1")
//}
//
//// In the consumer side...
//someAsyncFunction { error in
//    print(error ?? "sdf")
//    if let error = error {
//        print("Oops! Something went wrong...")
//    } else {
//        print("It has finished")
//    }
//}




class A{
    static var arr=[["a":"b","b":"c"],["a":"c"]]
    static var shared = A()
    init(){
        print("doing something")
    }
    var content = [Dictionary<String, AnyObject>]()
}

//var a = A()
//var dic = ["a":"c"]
//print(a.arr[0])
//a.arr[0] = dic
//print(a.arr)
//
print("wwww")
print(A.arr)
//print(A.shared)
print(A.shared.content)



















