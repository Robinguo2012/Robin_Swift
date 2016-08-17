//
//  main.swift
//  Swift02_字符串和字符
//
//  Created by Robin Guo on 16/5/18.
//  Copyright © 2016年 Robin Guo. All rights reserved.
//

import Foundation

print("Hello, World!")

let someString = "hello , morning"
// 两个字符串均为空并等价。
var emptyString = ""
var emptyString1 = String()

if emptyString.isEmpty{
    print("the string is empty")
}

var variableString = "horse"
variableString += "and carriage"

//字符串是值类型（Strings Are Value Types）函数传值会copy副本

for character in "Dog!👀".characters {
    print(character)
}

// 字符
let catClamationMark:Character = "!"
let catCharacters:[Character] = ["c","a","t","!","👘"]

let catString = String(catCharacters)
print(catString)

// 连接字符串和字符
let string1 = "hello"
let string2 = " there"

var welcome = string1 + string2

welcome.append(catClamationMark)

print(welcome)

let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

print(message)

let wiseWords = "\"Imagenation is more important than knowledge\" - Einstein"
print(wiseWords)

//可扩展的字形群集(Extended Grapheme Clusters) 
let eActue = "\u{E9}"
let combinedEactue = "\u{65}\u{301}"

print(eActue+combinedEactue)

let enclosedEactue = "\u{E9}\u{20DD}"
print(enclosedEactue)

let data = NSData()

let strin = String(data: data, encoding: NSUTF8StringEncoding)


var word = "cafe"
print("the number of \(word) is \(word.characters.count)")

word += "\u{301}"
print("the number of \(word) is \(word.characters.count)")

// 访问和修改字符串 (Accessing and Modifying a String)

let greeting = "caféTag"
let greetingCount = "cafeTag"
greeting[greeting.endIndex.predecessor()]
print(greeting[greeting.endIndex.predecessor()])
//greeting.startIndex.predecessor()

let index = greeting.startIndex.advancedBy(5)
let index1 = greetingCount.startIndex.advancedBy(5)

print(greeting.characters.count)
print(greetingCount.characters.count)

print(greeting.endIndex)
print(greetingCount[index1])

// 插入和删除
//welcome.insert("!", atIndex: welcome.endIndex)
print(welcome)

welcome.insertContentsOf(" my Darling".characters, at: welcome.endIndex.predecessor())

print(welcome)

welcome.removeAtIndex(welcome.endIndex.predecessor())
print(welcome)

let range = welcome.endIndex.advancedBy(-6)..<welcome.endIndex

welcome.removeRange(range)

print(welcome)
// "Voulez-vous un café?" 使用 LATIN SMALL LETTER E WITH ACUTE
let eActueQuestion = "Voulez-vous un caf\u{E9}?"

let combinedEactueQuestion = "Voulez-vous un caf\u{65}\u{301}?"

print(eActueQuestion)

if eActueQuestion == combinedEactueQuestion {
    print("There two strings are considered equal")
}

for index2 in eActueQuestion.characters.indices{
    print("\(eActueQuestion[index2])",terminator:" ")
}

let latinA:Character = "\u{41}"
let cyrillicCapitalLetterA:Character = "\u{0410}"

print(latinA)
print(cyrillicCapitalLetterA)

if latinA != cyrillicCapitalLetterA{
    print("These two characters are not equivalent")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

var act1Sence = 0

for sence in romeoAndJuliet {
    
    if sence.hasPrefix("Act 1"){
        act1Sence += 1
    }
}

print(act1Sence)

for codeUnit in romeoAndJuliet[0].utf8{
    print("\(codeUnit)\n",terminator:" ")
}
// Unicode 编码







        