//
//  main.swift
//  Swift17_类型转换
//
//  Created by sks on 16/7/25.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

class MediaItem {
    var name:String
    init(name:String){
        self.name = name;
    }
}

class Movie: MediaItem {
    var director: String
    
    init(name: String,director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String,artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let libarary = [Movie(name:"12",director: "Jack chen"),
                Movie(name:"23",director: "Zhang"),
                Movie(name:"2",director: "Zhao"),
                Song(name:"afds",artist: "Guo"),
                Song(name:"12",artist: "slsf")]

// 检查类型 (Checking Type) (is)
/*
 最后一个代码段创建了一个数组常量 library，包含两个 Movie 实例和三个 Song 实例。library 的类型是在它被初始化时根据它数组中所包含的内容推断来的。Swift 的类型检测器能够推断出 Movie 和 Song 有共同的父类 MediaItem，所以它推断出 [MediaItem] 类作为 library 的类型：
 */

var songCount = 0
var movieCount = 0

for item in libarary{
    if item is Movie{
        movieCount += 1
    }else{
        songCount += 1
    }
}

print("song count is \(songCount) movie count is \(movieCount)")

//向下转型(Downcasting) (as! as?)
for item in libarary{
    if let movie = item as? Movie{
        print("movie name is \(movie.name) director \(movie.director)")
    }else if let song = item as? Song{
        print("song name is \(song.name) artist \(song.artist)")
    }
}

// Any 和 AnyObject 的类型转换
/*
 Any 可以表示任何类型，包括函数类型.
 AnyObject 可以表示任何类类型的实例.
 */
// ** 只有当你确实需要它们的行为和功能时才使用 Any 和 AnyObject。在你的代码里使用你期望的明确类型总是更好的。
let someObjects: [AnyObject] = [Movie(name:"1232",director: "director_01"),
                   Movie(name:"121",director: "director_02"),
                   Movie(name:"323",director: "director_03")]

for item in someObjects{
    let movie = item as! Movie
    print("movie name \(movie.name) director \(movie.director)")
}

for movie in someObjects as! [Movie] {
    print("movie name \(movie.name) director \(movie.director)")
}

// Any
//let httpCode = (404, "Network")
//
//let errorCode: (Int,String) = (404,"Badnet")
//
//errorCode(404,"BadNet")

var things = [Any]()
things.append(0)
things.append(0.0)
things.append(5.0)
things.append("hello world")

let errorCode : (Int, String)
errorCode = (404, "badnet")
things.append(errorCode)

things.append(Movie(name:"12",director: "dsa"))
things.append({(name: String) -> String in "Hello ,\(name)"})

for thing in things{
    switch thing {
        
    case 0 as Int:
        print("zero as int")
    case 0 as Double:
        print("zero as double")
    case let someInt as Int:
        print("an integer vale as \(someInt)")
    case let double as Double:
        print("an double value as \(double)")
    case let someConter as String -> String:
        print(someConter("guohuab"))
        
    default:
        print("something else")
    }
}

let truple = [(3,"adf")]




