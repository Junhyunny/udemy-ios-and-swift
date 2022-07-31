//
//  main.swift
//  2022-07-31-struct-versus-class
//
//  Created by JUNHYUN KANG on 2022/07/31.
//

import Foundation

let ironMan = ClassHero(name: "Iron Man", universe: "Marvel")
var anotherMarvelHero = ironMan
anotherMarvelHero.name = "The Hulk"

// not error
// ironMan.name = ""

print("name of ironMan = \(ironMan.name)")
print("name of anotherMarvelHero = \(anotherMarvelHero.name)")

let hulk = StructHero(name: "Hulk", universe: "Marvel")
var anotherMarvelHeroAgain = hulk
anotherMarvelHeroAgain.name = "Iron Man"

print(hulk)
print(anotherMarvelHeroAgain)

// Cannot assign to property: 'hulk' is a 'let' constant 에러
// hulk.name = ""
