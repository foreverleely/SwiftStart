#Collection Types
![Collection Types](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Art/CollectionTypes_intro_2x.png)

**Collection Type 分为三种**

**1.Arrays 数组，有顺序的值得集合**

**2.Sets ，无序的唯一值得集合**

**3.Dictionaries 字典，无序的键值对的集合**

##Arrays
**数组中的元素可以重复**

###Arrzy Type Shorthand Syntax
**数组的简单句法，数组全写时Array<Element>，简写是[Element]**

###Creating an Empty Array

	var someInts = [Int]()
	print("someInts is of [Int] with \(someInts.count) items.")
	//Prints "someInts is of [Int] with 0 items."

	someInts = []
	//someInts 类型仍旧是 Int
	//someInts = [String]  //报错
	//不能再给 someInts 定义成其他的类型
	
#####小试牛刀
	var someIntandDoubleandString = [1,"dasd"]
	someIntandDoubleandString.append(3.2)
	someIntandDoubleandString += [2]
	someIntandDoubleandString += ["asdff"]

	var someTuple = (1.1,"tuple",4)
	someIntandDoubleandString.append(someTuple.1)  //正确
	//someIntandDoubleandString += someTuple.2  //报错

	print(someIntandDoubleandString,someTuple)
	//[1, dasd, 3.2, 2, asdff, tuple] (1.1, "tuple", 4)
	
**1.如果数组中只有单一类型，添加的时候只能添加那个类型的数据进来**

**2.如果原数组中没有要添加的类型，使用 append() 或者 += 会出错**

**3.多元数据类型的数组有数值型元素（int 或者 double 等）就可以添加大部分数值型元素进来**

**4.给数组添加元素，append() 可行，但是 += 会报错**

###Creating an Array with a Default Value
	var threeDoubles = [Double](count: 3, repeatedValue: 1.2)
	print(threeDoubles)
	//[1.2, 1.2, 1.2]
	
###Creating an Array by Adding Two Arrays together
	var anotherThreeDoubles = [Double](count: 2, repeatedValue: 2.4)
	var fiveDoubles = threeDoubles + anotherThreeDoubles
	print(fiveDoubles)
	//[1.2, 1.2, 1.2, 2.4, 2.4]
	
###Creating an Array with an Array Literal
	var shoppingList:[String] = ["Eggs","Milk"]
	//shoppingList 定义的是一个值为 String 类型的数组，因为确定了数组类型，该数组仅仅只能包含 String 值
	let shoppingList2:[String] = ["Eggs","Milk"]
	
###Accessing and Modifying an Array
**查看数组元素个数的属性 count 是只读 read-only**

**使用 isEmpty 属性快速查看该数组的 count 属性对应为 0**

	if shoppingList.isEmpty {
    	print("The shopping list is empty.")
	} else {
    	print("The shopping list is not empty.")
	}
	
**使用 append() 方法可以给该可变数组添加元素**

	shoppingList.append("Flour")

**使用 += 可以添加一个或多个相同类型的元素**

	shoppingList += ["Bakin Powder"]
	shoppingList += ["Chocolate Spreak","Cheese","Butter"]

**使用下标语法 subscript syntax 获取数组中的元素**

	var firstItem = shoppingList[0]  //现在暂时看来数组好像没有 Tuple 类型好用
	shoppingList[0] = "Six eggs"
	print(shoppingList)
	//["Six eggs", "Milk", "Flour", "Bakin Powder", "Chocolate Spreak", "Cheese", "Butter"]

**使用下标语句还可以改变一个范围的元素**

	shoppingList[4...6] = ["Bananas","Apples"]
	print(shoppingList)
	//["Six eggs", "Milk", "Flour", "Bakin Powder", "Bananas", "Apples"]
	//改变数组一个范围的元素的值，也可能改变了数组元素的个数，上异步操作时，数组元素个数是 7，现在是 6
	//shoppingList[6] = "sss"
	//fatal error: Array index out of range
	//注意：不能使用下标语句在数组末尾添加一个元素

**使用  insert(_:atIndex:) 在特定位置插入元素**

	shoppingList.insert("Maple Syrup", atIndex: 0)
	print(shoppingList)
	//["Maple Syrup", "Six eggs", "Milk", "Flour", "Bakin Powder", "Bananas", "Apples"]

**使用 removeAtIndex(_:) 删除在特定位置的元素，并且范围删除的这个元素**

	let mapleSyrup = shoppingList.removeAtIndex(0)
	print(mapleSyrup)
	//Maple Syrup

**使用 removeLast() 来删除数组最后一个元素 而不是 removeAtIndex(_:) 以避免超出数组范围，与 removeAtIndex(_:) 一样返回删除的元素**

	let apples = shoppingList.removeLast()
	print(apples)
	//Apples


###Iterating Over an Array
**遍历数组**

	for item in shoppingList {
    	print(item)
	}

**使用 enumerate() 方法来遍历数组的每个元素的下标数和值**

	for (index,value) in shoppingList.enumerate() {
    	print("Item \(index + 1): \(value)")
	}
	

##Sets
**set 包含的是 (相同数据类型) 没有排序 不重复的 元素**

####Hash Values for Set Types
**元素的类型必须哈希值化，也就是这个类型必须提供一个计算哈希值的方式给这个元素自己，哈希值时 Int 类型的值，并且对于所有对象在比较上时相等的，比如 if a == b，那么 a.hashValue == b.hashValue**

**Swift 的所有基本类型（比如 String, Int, Double,和 bool）默认的都哈希值化，并且能够用于作为 Set 的值的类型，和Dictionary 的值的类型，枚举值 Enumerations 也是默认哈希值化**

###Set Type Synatx
**Set<Element> Element 是该 Set 可以存储的值的类型，与数组不同，Set 没有简写形式**

##Creating and Initalizing an Empty Set
	var letters = Set<Character>()
	print("letters is of type Set<Character> with \(letters.count) items")

**同 Array 一样，如果定义时给出了类型，那么这个 Set 永远就是那个类型**

	letters.insert("a")
	letters = []
**letters 类型依旧是 Set<Character>**

###Creating a Set with an Array Literal
	var favoriteGenres:Set<String> = ["Rock","Classical","Hip hop"]
	//同 Array，favoriteGenres 这个 Set 中的元素只能是 String 
	//由于 Swift 会智能给 必须有类型的 Set 定义类型，所以，有时可以省略类型
	var favoriteGenres2:Set = ["Rock", "Classical", "Hip hop", 1, 3.2]
	
**count 属性 只读 read-only**

	print("I have \(favoriteGenres.count) favorite music genres.")

**isEmpty 属性**

	if favoriteGenres.isEmpty {
    	print("As far as music goes, I'm not picky.")
	} else {
    	print("I have particular music preferences.")
	}

**insert(_:) 插入方法**

	favoriteGenres.insert("Jazz")
	print(favoriteGenres)
	//["Rock", "Classical", "Jazz", "Hip hop"]
	//再次重申 无序的

**remove(_:) 删除某个特定的元素，如果这个 Set 有这个元素，将删除这个元素，并返回这个元素，如果这个元素没有，则删除的是 nil，并且返回的是 nil**

	let removedGenre:String = favoriteGenres.remove("Rock")!
	print("\(removedGenre)? I'm over it.")
	//Rock? I'm over it.
	//因为 removedGenre 会是一个 Optional 类型，所以在这里确定好它的类型，注意结尾的感叹号
	let removedGemre2 = favoriteGenres.remove("Rock")
	print(removedGemre2)
	//nil

**contains(_:) 检查该 Set 是否包含特定元素，返回 true 或者 false**

	if favoriteGenres.contains("Funk") {
    	print("I get up on the good foot.")
	} else {
    	print("It's too funky in here.")
	}

**Iteraing Over a Set**

	for genre  in favoriteGenres {
    	print(genre)
	}
	//let genreOne = favoriteGenres.remove("Jazz")
	//print(genreOne)
	//Optional("Jazz")
	//奇怪!前面定义的 removedGenre 如果不给定类型，它是 Optional ，genreOne 也是这样，但是这里的 genre 没有给类型，genre 却不是 Optional，奇怪吧！

**sort() 按照数组的排序给 Set “临时”做出排序（切记！这个 Set 始终还是无序的）**
**没使用 sort() 方法遍历输出是无序的（尽管是无序的，但是貌似还是有一个固定的顺序，也许数据少没有看出变化），用了之后就是 元素是按它的元素对应ASCII值对应大小排序的**

	for genre in favoriteGenres.sort() {
    	print(genre)
	}
	//Classical
	//Hip hop
	//Jazz
	
###Performing Set Operations
**我们可以搞笑的做基本的 Set 操作，比如比较两个 Set 相同的元素等**

####Fundemental Set Operations
**下图有两个 Set ，他们有相同的元素**
![set](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Art/setVennDiagram_2x.png)
**intersect(_:) 方法是用两个 Set 都有的元素创建一个新的 Set，相当于由 两集合的与 组成的一个新集合**

**exclusiveOr(_:) 方法是两个 Set 出去都有的元素剩余的元素组成的新的 Set，相当于 两集合的或 减去 两倍的 两集合的与 组成的一个新集合**

**union(_:) 方法是两个 Set 所有的元素组成一个新的 Set，相当于 两集合的或 减去 一倍的 两集合的与 组成的一个新集合**

**subtract(_:) 方法是 A Set 除去 A,B Set 都有的元素 余下来的 A 组成的一个新的 Set ，相当于集合A 减去 集合A和集合B的与 后组成的新集合**

	let oddDigits:Set               = [1, 3, 5, 7, 9]
	let evenDigits:Set              = [0, 2, 4, 6, 8]
	let singleDigitPrimeNumbers:Set = [2, 3, 5, 7]

	print(oddDigits.intersect(singleDigitPrimeNumbers).sort())
	//[3, 5, 7]
	print(oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort())
	//[1, 2, 9]
	print(oddDigits.union(evenDigits).sort())
	//[0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	print(oddDigits.subtract(singleDigitPrimeNumbers).sort())
	//[1, 9]

###Set Membership and Equality
![set](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/Art/setEulerDiagram_2x.png)
**比较两个 Set 的包含关系**

**== 万能的比较，到处可见**

**isSubsetOf(_:) 判断一个 Set 中所有元素在另一个 Set 中都包含**

**isSupersetOf(_:) 判断一个 Set 包含另一个 Set 中所有元素**

**isStrictSubsetOf(_:) or isStrictSupersetOf(_:) ，在 isSubsetOf(_:) 或 isSupersetOf(_:)基础上，两 Set 不相等**

**isDisjointWith(_:) 判断两个 Set 是否有相同元素**

	let houseAnimals:Set = ["🐶", "🐱"]
	let farmAnimals:Set  = ["🐮", "🐔", "🐑", "🐶", "🐱"]
	let cityAnimals:Set  = ["🐦", "🐭"]

	print(houseAnimals.isSubsetOf(farmAnimals))
	//true
	print(farmAnimals.isSupersetOf(houseAnimals))
	//true
	print(farmAnimals.isDisjointWith(cityAnimals))
	//true
	
	
##Dictionaries
**字典存放的是 相同类型的 key 和 相同类型的 value ，它们组成特定的一对一关系，并且在字典里处于无序状态，每个 value 对应唯一的 key ，而 key 则标识了在字典里的这些 value**

###Dictionary Type Shorthand Syntax

**全写 Dictionary<Key,Value>，简写 [Key:Value] **

###Creating an Empty Dictionary

	var nameofIntegers = [Int: String]()
	//Key 类型为 Int，Value 类型为 String

	nameofIntegers[16] = "sixteen"
	print(nameofIntegers)
	//[16: "sixteen"]

**当前文已经提供了类型，我们可以将该字典变为一个空的字典 [:]，它的键值类型不变**

	nameofIntegers = [:]


###Creating a Dictionary with a Dictinoary Literal
	var airports:[String:String] = ["YYZ":"Toronto Pearson","DUB":"Dublin"]

**同其他集合类型，Swift 也可以在没有给出类型的情况下，智能的判断出集合的类型**

	var airports2 = ["YYZ":"Toronto Pearson","DUB":"Dublin"]

**count 属性**

**isEmpty 属性**

**增加或者修改一个键值对**

	airports["LHR"] = "London"
	print(airports)
	//["DUB": "Dublin", "LHR": "London", "YYZ": "Toronto Pearson"]

**updateValue(_:forKey:) 新增或者修改一个键值对，如果存在 key ，则返回该操作前的 value ，如果没有该 key ，返回 nil**

	if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    	print("The old alue for DUB was \(oldValue)")
	}
	//The old alue for DUB was Dublin
	print(airports)
	//["DUB": "Dublin Airport", "LHR": "London", "YYZ": "Toronto Pearson"]

**下标语法也可以获取特定 key 的 value，有的话返回，没有返回 nil**

	if let airportName = airports["DUB"] {
    	print("The name of the airport is \(airportName).")
	} else {
    	print("That airport is not in the airports dictionary.")
	}
	// Prints "The name of the airport is Dublin Airport."

**removeValueForKey(_:) 删除特定 key 的 value ，并且返回对应 value，没有该 key ，返回 nil**

	if let removedValue = airports.removeValueForKey("DUB") {
    	print("The removed airport's name is \(removedValue).")
	} else {
    	print("The airports dictionary does not contain a value for DUB.")
	}
	// Prints "The removed airport's name is Dublin Airport."
	print(airports)
	//["LHR": "London", "YYZ": "Toronto Pearson"]


###Iterating Over a Dictionary
	for (airportCode, airportName) in airports {
    	print("\(airportCode): \(airportName)")
	}
	// YYZ: Toronto Pearson	
	// LHR: London Heathrow

	for airportCode in airports.keys {
    	print("Airport code: \(airportCode)")
	}
	// Airport code: YYZ
	// Airport code: LHR

	for airportName in airports.values {
    	print("Airport name: \(airportName)")
	}
	// Airport name: Toronto Pearson
	// Airport name: London Heathrow


**使用字典生成数组**

	let airportCodes = [String](airports.keys)
	// airportCodes is ["YYZ", "LHR"]

	let airportNames = [String](airports.values)
	// airportNames is ["Toronto Pearson", "London Heathrow"]