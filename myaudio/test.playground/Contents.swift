//: Playground - noun: a place where people can play

import Foundation


let arr = [0,1,2,3,4]
let em = [Int]()

extension Array{
    func next(_ index: Int) -> (Int?, Element?){
        if self.count==0 {return (nil, nil)}
        var nextIndex : Int
        if index<0{nextIndex = index+self.count}
        else if index>=self.count-1 {nextIndex = index+1-self.count}
        else{nextIndex = index+1}
        
        return (nextIndex, self[nextIndex])
    }
}

//arr[nil]]
//em[0]
em.next(0)
em.next(1)
arr.next(-1)
arr.next(-2)
arr.next(0)
arr.next(1)
arr.next(2)
arr.next(3)
arr.next(4)
arr.next(5)


