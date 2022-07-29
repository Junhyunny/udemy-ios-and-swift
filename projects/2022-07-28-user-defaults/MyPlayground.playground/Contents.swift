import Foundation
import Darwin

let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Angela", forKey: "Name")
defaults.set(Date(), forKey: "AppLastOpenedByUser")
defaults.set([1, 2, 3], forKey: "myArray")
defaults.set(["first": "Junhyunny", "second": "blog"], forKey: "myDictionary")

print(defaults.float(forKey: "Volume"))
print(defaults.bool(forKey: "MusicOn"))
print(defaults.string(forKey: "Name")!)
print(defaults.object(forKey: "AppLastOpenedByUser")!)

let myArray = defaults.array(forKey: "myArray") as! [Int]
let myDictionary = defaults.dictionary(forKey: "myDictionary")

print(myArray)
print(myDictionary)
