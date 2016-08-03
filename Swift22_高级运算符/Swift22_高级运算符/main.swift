//
//  main.swift
//  Swift22_高级运算符
//
//  Created by sks on 16/7/29.
//  Copyright © 2016年 sks. All rights reserved.
//

import Foundation

// 按位取反 ~
/*
 按位取反运算符（~）可以对一个数值的全部比特位进行取反
 */

let initialBits: UInt8 = 0b00001111
let invertBits: UInt8 = ~initialBits // 0b11110000

print(invertBits)

// 按位取与 &
/*
按位与运算符（&）可以对两个数的比特位进行合并。它返回一个新的数，只有当两个数的对应位都为 1 的时候，新数的对应位才为 1
*/
let firstSixBits: UInt8 = 0b11111100
let secondSixBits: UInt8 = 0b00111111

let middleFourSixBits = firstSixBits & secondSixBits // 0b00111100
print(middleFourSixBits)

// 按位或运算符 |
/*
 按位或运算符（|）可以对两个数的比特位进行比较。它返回一个新的数，只要两个数的对应位中有任意一个为 1 时，新数的对应位就为 1
 */
let someBits: UInt8 = 0b10110010
let moreBits: UInt8 = 0b01011110
let combinedbits = someBits | moreBits // 等于 11111110

// 按位异或运算 ^
/*
 按位异或运算符（^）可以对两个数的比特位进行比较。它返回一个新的数，当两个数的对应位不相同时，新数的对应位就为 1
 
 对一个数进行按位左移或按位右移，相当于对这个数进行乘以 2 或除以 2 的运算。将一个整数左移一位，等价于将这个数乘以 2，同样地，将一个整数右移一位，等价于将这个数除以 2。
 
 
 无符号整数的移位运算
 
 对无符号整数进行移位的规则如下：
 
 已经存在的位按指定的位数进行左移和右移。
 任何因移动而超出整型存储范围的位都会被丢弃。
 用 0 来填充移位后产生的空白位。
 
 */
let Bits1: UInt8 = 0b00010100
let Bits2: UInt8 = 0b00000101

let outputBits = Bits1 ^ Bits2 // 0b00010001
print(outputBits)

// 按位左移(<<),右移(>>)运算符
let shiftBits = 0b00000100
shiftBits << 1
shiftBits >> 2
shiftBits >> 4
shiftBits << 3

// 使用位移对其他数据类型进行编码和解码
let pink: UInt32 = 0xCC6699

let redComponent = (pink & 0xff0000) >> 16 // redComponet 0xCC
let greenComponent = (pink & 0x00ff00) >> 8 // greenComponent 0x66
let blueComponent = (pink & 0x0000ff)      // blueComponent 0x99

// 溢出运算
var potentialOverflow = UInt16.max
//potentialOverflow =+ 1

// 运算符函数
struct Vector2D {
    var x = 0.0,y = 0.0
}

func + (left: Vector2D, right: Vector2D) -> Vector2D{
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

let vector = Vector2D(x: 1.0, y: 2.0)
let vectorAnother = Vector2D(x: 3.0, y: 2.0)

let combineVector = vector + vectorAnother

print(combineVector.x)

// 前缀,后缀运算符
/*
 要实现前缀或者后缀运算符，需要在声明运算符函数的时候在 func 关键字之前指定 prefix 或者 postfix 修饰符
 */
prefix func - (vector: Vector2D) -> Vector2D{
    return Vector2D(x: -vector.x, y: -vector.y)
}

let positive = Vector2D(x: 1.0, y: 20)
let negative = -positive

print(negative)

// 复合赋值运算符
/*
 复合赋值运算符将赋值运算符（=）与其它运算符进行结合。例如，将加法与赋值结合成加法赋值运算符（+=）。在实现的时候，需要把运算符的左参数设置成 inout 类型，因为这个参数的值会在运算符函数内直接被修改。
 */

// 注意 : 不能对默认的赋值运算符（=）进行重载。只有组合赋值运算符可以被重载。同样地，也无法对三目条件运算符 （a ? b : c） 进行重载。
func += (inout left: Vector2D,right: Vector2D){
    left = left + right
}

// 等价运算符
func == (left: Vector2D,right: Vector2D) -> Bool{
    return (left.x == right.x) && (left.y == right.y)
}

func != (left: Vector2D, right: Vector2D) -> Bool{
    return !(left == right)
}

// 自定义运算符
/*
 除了实现标准运算符，在 Swift 中还可以声明和实现自定义运算符。可以用来自定义运算符的字符列表请参考运算符。
 
 新的运算符要使用 operator 关键字在全局作用域内进行定义，同时还要指定 prefix、infix 或者 postfix 修饰符：
 */

prefix operator +++ {}

prefix func +++ (inout vector: Vector2D) -> Vector2D {
    vector += vector
    return vector
}

var vector0 = Vector2D(x: 20.0, y: 10.0)
let afterDoubling = +++vector0

print(afterDoubling)

// 自定义中缀运算符的结合行
/*
 因为它本质上是属于“相加型”运算符，所以将它的结合性和优先级被分别设置为 left 和 140，这与 + 和 - 等默认的中缀“相加型”运算符是相同的。
 */

infix operator +- { associativity left precedence 140 }
func +-(left: Vector2D, right: Vector2D) -> Vector2D{
    return Vector2D(x: left.x + right.x, y: left.y - right.y)
}

let firstVector = Vector2D(x: 1.0, y: 2.0)
let secondVector = Vector2D(x: 2.0, y: 3.0)

let plusMinusVector = firstVector +- secondVector
print(plusMinusVector)











