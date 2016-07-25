#SwiftStart - TheBasic
##constants and variables
####decleare constants and variable

	let maximumNumberOfLoginAttempts = 10

	var currentLoginAttempt = 0

####decleare multiple constants or multiple variables

	let x = 0, y = 1, z = 2
	
	var xx = 0, yy = 1, zz = 2




##Type Annotations
	var welcomeMessage:String

**String相当于是对变量 welcomeMessage 的类型的注释**

	var red, green, blue:Double

**同时对多个变量进行注释**



##Naming Constants and Variabls
	let π = 3.14159265357

	let 你好 = "世界你好"

	let 🐶🐶 = "dogdog"

**常量和变量的名字可以包含很多特性，但是不能包含以下：**

**1.空格 2.数学符号 3.箭头 4.私有的或找不到的编码符号 5.横线“-” 6.方框“☐” 7.不能以数字开头**



##Print
	var friendlyWelcome = "Hello!"

	friendlyWelcome = "Bonjour!"

	print("The current value of friendlyWelcome is \(friendlyWelcome)")

	// Prints "The current value of friendlyWelcome is Bonjour!"

**使用 \(对象) 做替换，有别于objc NSLog(@"%@",对象)**



##Semiclons
	let cat = "🐱"; print(cat)

	// Prints "🐱"

**分离的声明如果写在一行，中间必须加分号**

	let dog = "dog"

	print(dog)



##Integers
**Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms.**

####Integer Bounds
	let minValue = UInt8.min

	let maxValue = UInt64.max

	print("8位int类型对应:",minValue,"64位int类型对应:",maxValue)



##Int （signed integer）
**在32位平台，Int与Int32的大小一致；在64位平台，Int与Int64的大小一致**
##UInt （unsigned integer）
**在32位平台，UInt与UInt32的大小一致；在64位平台，UInt与UInt64的大小一致**

**signed 和 unsigned 区别**

**所有的整型类型都有两种变体：signed 和 unsigned。 有时候，要求整型变量能够存储负数，有时候则不要求。
没有使用关键字unsigned生命的整型变量都被视为无符号的，这种变量可以为正，也可以为负；而unsigned整型变量只能为正
signed 和 unsigned 整型变量占用的内存空间大小相同，而signed整型变量的部分存储空间被用于存储指出该变量是为正还是为负的息，
因此unsigned整型变量能存储的最大值为signed整型变量能够存储的最大正数的两倍**



##Floating-Point Numbers
**Double represents a 64-bit floating-point number.**

**Float represents a 32-bit floating-point number.**

	let double1Value:Double = 2.000010000000011000000000000000000000000000000000001

	print(double1Value)
	//2.00001000000001
**Double 最多显示小数点后14位数，精确到15位小数**

	let float1Value:Float = 1.0000111000000000000

	print(float1Value)
	//1.00001
**Float 最多显示小数点后5位数，精确到6位小数**

**默认情况下小数不如 3.0 ，系统给的是Double**



##Type Safety and Type Infference
**swift会自动为对象设定类型**

	let anotherPi = 3 + 0.14159

**anotherPi is also inferred to be of type Double**



##Numeric Literals
	let decimalInteger = 17

	let binaryInteger = 0b10001       // 17 in binary notation

	let octalInteger = 0o21           // 17 in octal notation

	let hexadecimalInteger = 0x11     // 17 in hexadecimal notation

**For decimal numbers with an exponent of exp, the base number is multiplied by 10exp:**

**1.25e2 means 1.25 x 102, or 125.0.**

**1.25e-2 means 1.25 x 10-2, or 0.0125.**

**For hexadecimal numbers with an exponent of exp, the base number is multiplied by 2exp:**

**0xFp2 means 15 x 22, or 60.0.**

**0xFp-2 means 15 x 2-2, or 3.75.**

**可以通过加0 加下划线“_”的方式来使数值更易读，而不影响数值**



##数值类型的转化
	let pi = 3.14
	
	let integerPi = Int(pi)

	let three = 3

	let pointOneFourOneFiveNine = 0.14159

	let pi2 = Double(three) + pointOneFourOneFiveNine



##Type Aliases
	typealias AudioSample = UInt16

	var maxAmplitudeFound = AudioSample.min

**maxAmplitudeFound is now 0**



##Tuples
	let http404Error = (404, "Not Found")
	
	// http404Error is of type (Int, String), and equals (404, "Not Found")

	let (statusCode, statusMessage) = http404Error
	
	print("The status code is \(statusCode)")
	
	// Prints "The status code is 404"
	
	print("The status message is \(statusMessage)")
	
	// Prints "The status message is Not Found"

	let (justTheStatusCode, _) = http404Error
	
	print("The status code is \(justTheStatusCode)")

	// Prints "The status code is 404"

**当只想去一个tuple对象的部分值时，可以用"_"来忽略其他值**

	let (justTheStatusCode2) = http404Error

	print("The status code is \(justTheStatusCode2)")

	// Prints "The status code is (404, "Not Found")"

	print("The status code is \(http404Error.0)")

	// Prints "The status code is 404"

	print("The status message is \(http404Error.1)")

	// Prints "The status message is Not Found"
**有点像数组！！！**

	let http200Status = (statusCode: 200, description: "OK")

	print("The status code is \(http200Status.statusCode)")

	// Prints "The status code is 200"

	print("The status message is \(http200Status.description)")

	// Prints "The status message is OK"

**从上面那个例子看像数组，从这个例子看又像字典！！！**



##Optionals
**用到optionals的场合是在一个值可能为空的**

	let possibleNumber = "123"

	let convertedNumber = Int(possibleNumber)

**convertedNumber is inferred to be of type "Int?", or "optional Int"**

	var serverResponseCode: Int? = 404
	
	serverResponseCode = nil

**nil cannot be used with nonoptional constants and variables. If a constant or variable in your code needs to work with the absence of a value under certain conditions, always declare it as an optional value of the appropriate type.**

	var surveyAnswer: String?
	
**如果定义一个optional变量，在没赋值前，它等于nil**

**Swift’s nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. In Swift, nil is not a pointer—it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types.**

	if let firstNumber = Int("4"), secondNumber = Int("42") where firstNumber < secondNumber {
    	print("\(firstNumber) < \(secondNumber)")
	}
	// Prints "4 < 42"


##Implicitly Unwrapped Optionals
 ***确定有值的 optionals ***
 
	let possibleString: String? = "An optional string." 
	
	//possibleString 为 optionals

	let forcedString: String = possibleString! 
	
	// requires an exclamation mark（需要一个感叹号😂）

	let assumedString: String! = "An implicitly unwrapped optional string."

	let implicitString: String = assumedString 
	
	// no need for an exclamation mark

**如果一个 implicitly unwrapped optional 在之后可能会变为 nil ，就不要当做 implicitly unwrapped optional 处理,验证是否为 nil 的对象就用normal optional 来修饰**



##Error Handling
	func canThrowAnError() throws {
    	// this function may or may not throw an error
	}
**在方法中包含 throws **

	func makeASandwich() throws {
	    // ...
	}
	
	do {
	
	    try makeASandwich()	    
	    eatASandwich()
	} catch Error.OutOfCleanDishes {
	
	    washDishes()
	} catch Error.MissingIngredients(let ingredients) {
	
	    buyGroceries(ingredients)
	}
**执行 makeASandwich() 方法时，如果出现 Error.OutOfCleanDishes 就去执行 washDishes()，如果出现 Error.MissingIngredients(let ingredients) 就去执行 buyGroceries(ingredients)**




##Debugging with Assertions
	let age = -3
	
	assert(age >= 0, "A person's age cannot be less than zero")
**和objc中NSAssert一样，参数1为真，就跳过当前断点，执行后面的操作，否则，打印参数2，并停止之后的操作**

	assert(age >= 0)
**也可以不做参数1为否时的打印操作**