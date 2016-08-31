//
//  main.swift
//  Tour_1
//
//  Created by liyangly on 16/8/31.
//  Copyright © 2016年 liyang. All rights reserved.
//

import Foundation

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("111")
case "cucuber","watercress":
    print("222")
case let x where x.hasSuffix("pepper"):
    print("333 \(x)")
default:
    print("444,no need break")
}

let interestingNumbers = [
    "Prime":[2,3,5,7,11,13],
    "Fibonacci":[1,1,2,3,5,8],
    "Square":[1,4,9,16,25]
]
var largest = 0
for (kind,numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}
print("text2 largest:\(largest)")

var n = 2
while n < 100 {
    n = n + 2
}
print(n)
var m = 2
repeat {
    m = m + 2
} while m < 100
print("text3 m:\(m)")

var total = 0
for i in 0..<4 {
    total += 1
}
print("text4 total:\(total)")

func greet(_ person: String, _ day: String) -> String {
    return "Hello \(person),today is \(day)"
}
print("text5 func"+greet("Bob","Tuesday"))
//测试发现只有写成 _ key 才可以才方法调用里省略调用函数时的参数key,不对，这么写后
//参数key必须省略,一种新的方法参数简写方法，就像上面那样
//如果你按下面这个例子写，那么你的对应参数只能是空格前面的那个，就像下面这个只能是on


//下面方法看似格式不对应，然测能够正确执行，但是如果把 _ person 间空格去掉，
//swift 就只能认为对应部分参数是 _person
func greet1(_ person: String, on day: String) -> String {
    return "Hello \(person),todaay is \(day)"
}
print(greet1("John",on: "Wednesday"))

func calculateStatistics(scores: [Int]) -> (min: Int,max: Int,sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        
        sum += score
    }
    
    return (min,max,sum)
    
}

let statistic = calculateStatistics(scores: [5,3,100,3,9])
print("\(statistic.min) \(statistic.max) \(statistic.sum)")
print("text6 \(statistic.2)")

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    
    return sum
    
}

print(sumOf())
print("text7 \(sumOf(numbers: 42,597,12))")

func average(scores: Int...) -> Int {
    var average = 0
    var count = 0
    
    for score in scores {
        average += score
        count += 1
    }
    average = average/count
    
    return average
    
}

print(average(scores:1,2,3))

//方法中可以另一个方法的返回作为它的参数
func returnFifteen() ->Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    
    return y
}
print("text8 \(returnFifteen())")

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print("text9 \(increment(7))")

//函数作为另一个函数的参数的value
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [11,19,71,1]
print("text10 \(hasAnyMatches(list: numbers,condition: lessThanTen))")

//非常灵活的函数定义方式
//用in来做分离以多次执行任务
//map用于将每个数组元素通过某个方法进行转换。map属于swift高阶函数
print(numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
}))

let mappedNumbers = numbers.map({number in 3*number})
print("text11 \(mappedNumbers)")

//numbers数组降序排列,相邻的两个前面的后面的大
let sortedNumbers = numbers.sorted {$0 > $1}
print(sortedNumbers)

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print("text12 \(shapeDescription)")

class NamedShape {
    var numberOfSides = 0
    var name:String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
}
var namedshape = Shape()
namedshape.numberOfSides = 7
var nameshapeDescription = namedshape.simpleDescription()
print("text12 \(nameshapeDescription)")

class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A sqare with sides of length \(sideLength)"
    }
    
}
let test = Square(sideLength:5.2, name: "my test square")
print(test.area())
print("text13 \(test.simpleDescription())")

class Circle: NamedShape {
    var radius:Double
    
    init(radius: Double, name: String) {
        self.radius = radius
        super.init(name: name)
        numberOfSides = 5
    }
    
    func area() -> Double {
        return radius * radius
    }
    
    override func simpleDescription() -> String {
        return "\(area()) \(name) \(numberOfSides)"
    }
    
}

let circle = Circle(radius:3.14, name: "liyangly")
print("text14 \(circle.simpleDescription())")

class EquilateralTriangle: NamedShape {
    var sideLength:Double = 0.0
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name:name)
        numberOfSides = 3;
    }
    var perimeter:Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
}
var triangle = EquilateralTriangle(sideLength:3, name: "liyang")
//执行get方法
print(triangle.perimeter)
//执行set方法
triangle.perimeter = 12.0
//因为执行了perimeter的set操作，所以sideLength值变了
//注意set方法中的newValue，这是set方法中新值的固定名
print(triangle.sideLength)

class TriangleAndSquare {
    var triangle:EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square:Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size,name: name)
        triangle = EquilateralTriangle(sideLength: size,name: name)
    }
    
}

var trigangleAndSquare = TriangleAndSquare(size:10, name: "liyang")
print(trigangleAndSquare.triangle.sideLength)
print(trigangleAndSquare.square.sideLength)
trigangleAndSquare.square = Square(sideLength:50, name:"lilili")
print(trigangleAndSquare.triangle.sideLength)

let optionalSquare:Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength
print("text15 \(sideLength)")


