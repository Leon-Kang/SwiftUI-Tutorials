//: [Previous](@previous)

import Foundation

//class Dragon {
//
//}

//class BlackDragon: Dragon {
////    func fire() {
////        print("fire~~~")
////    }
//}

//class RedDragon: Dragon {
////    func fire() {
////        print("fire~~~")
////    }
//}

//BlackDragon().fire()
//RedDragon().fire()

//extension Dragon {
//    func fire() {
//        print("fire!!!")
//    }
//
//    func fly() {
//        print("fly~~~")
//    }
//}


protocol DragonFire {
    
}

protocol DragonFly {
    var wing: Int { get }
}

extension DragonFire {
    func fire() {
        print("fire!!!")
    }
}

extension DragonFly {
    mutating func changeWing() {
        
    }
    
    func fly() {
        print("fly~~~")
    }
}

typealias Dragon = DragonFly & DragonFire

class BlackDragon: Dragon {
    var wing = 2
    
}

class RedDragon: Dragon {
    var wing = 2
    func changeWing() {
        wing = 6
    }
}

class YellowDragon: DragonFire {
    
}

BlackDragon().fly()
let redDragon = RedDragon()
print(redDragon.wing)
redDragon.changeWing()
print(redDragon.wing)
