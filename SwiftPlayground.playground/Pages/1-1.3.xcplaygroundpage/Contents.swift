import UIKit

// 1.2
let drogons = ["red dragons", "white dragons", "blue dragons"]
func showDragons(dragons: [String]) {
    for dragon in dragons {
        print("\(dragon)")
    }
}
showDragons(dragons: drogons)

let numberDragons = [1222, 2222, 3333]
func showNumberDragons(dragons: [Int]) {
    for dragon in dragons {
        print("\(dragon)")
    }
}
showNumberDragons(dragons: numberDragons)

func dragons<T>(dragons: [T]) {
    for dragon in dragons {
        print("\(dragon)")
    }
}
dragons(dragons: numberDragons)
dragons(dragons: drogons)

// 1.2.1
struct HTNTransition<S: Hashable, E: Hashable> {
    let event: E
    let fromState: S
    let toState: S
    
    init(event: E, fromState: S, toState: S) {
        self.event = event
        self.fromState = fromState
        self.toState = toState
        if fromState == toState {
            print("wrong state")
        }
    }
}

// 1.2.2
protocol HTNState {
    associatedtype StateType
    func add(_ item: StateType)
}

struct numberStates: HTNState {
    typealias StateType = Int
    func add(_ item: Int) {
        
    }
}
 
struct states<T>: HTNState {
    func add(_ item: T) {
        
    }
}

// 1.2.4
func stateFilter<FromState: HTNState, ToState: HTNState>(_ from: FromState, _ to: ToState) where FromState.StateType == ToState.StateType {
    
}

// 1.3.2
class stateItr: IteratorProtocol {
    var num: Int = 1
    func next() -> Int? {
        num += 2
        return num
    }
}

func findNext<I: IteratorProtocol>(elm: I) -> AnyIterator<I.Element> where I.Element == Int {
    var l = elm
    print("\(l.next() ?? 0)")
    return AnyIterator { l.next() }
}

findNext(elm: findNext(elm: stateItr()))

// 1.3.5
var cats = ["Tabby", "Snow", "Cyclomon"]
func wearHat(cat: String) -> String {
    return cat + " wear hat"
}
let catsWithHat = cats.map(wearHat)

// 1.3.6
var masters = ["Joson", "Curly", "Lana"]
var names = [cats, masters]
let allWithHat = names.flatMap{name in
    name.map(wearHat)
}

// 1.3.8
var nums = [Int]()
var myArray = nums + [2, 3, 4] + [5, 6]
var animals: [String] = ["dog", "cat", "mice"]

animals.append("bird")
animals += ["ant"]

var firstItem = myArray[0]
animals[0] = "red dog"
animals[2...4] = ["black cat", "white cat"]
animals.insert("s dog", at: 0)
let mapleSyrup = animals.remove(at: 0)
let apples = animals.removeLast()

for animal in animals {
    print(animal)
}
for (index, animal) in animals.enumerated() {
    print("animal \(String(index + 1)): \(animal)")
}

// 1.3.9
let strongArray = NSPointerArray.strongObjects()
let weakArray = NSPointerArray.weakObjects()

// 1.3.10
var strs = [Int: String]()
var colors: [String: String] = ["red": "#e83f45"]
strs[16] = "sixteen"

if let oldValue = colors.updateValue("#e83f47", forKey: "red") {
    print("The old value for DUB was \(oldValue).")
}

for (key, value) in colors {
    print("\(value): \(key)")
}

let newColorValues = colors.map { "hex: \($0.value)" }
let newColors = colors.mapValues { "hex: \($0)" }

// 1.6
struct DragonFirePosition {
    var x: Int64 // 8
    var y: Int32 // 4
}

struct DragonHomePosition {
    var x: Int32 // 4 + 4
    var y: Int64 // 8
}

let firePosiontionSize = MemoryLayout<DragonFirePosition>.size
let homePosiontionSize = MemoryLayout<DragonHomePosition>.size
