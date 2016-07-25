###Initializing an Empty String
	var emptyString = ""
	// empty string literal
	var abotherEmptyString = String()
	// initializer syntax
	// these two strings are both empty, and are equivalent to each other

**判断一个 String 值是empty 可以通过它的布尔值 isEmpty 属性**
	
	if emptyString.isEmpty {
    	print("Noting to see here")
	}
	//prints "Noting to see here"



###String Mutability
** Objective-C 和 Cocoa 中，string 可以被 mutate（突变）**



###Characters
**Characters 必须只包含一个单一的 character**

	for character in "Dog!🐶".characters {
    	print(character)
	}
	// D
	// o
	// g
	// !
	// 🐶


	let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
	let catString = String(catCharacters)
	print(catString)
	// Prints "Cat!🐱"
	//String 值可以通过一组 Characters 来初始化



####Concatenating Strings and Characters
	let string1 = "hello"
	let string2 = " there"
	var welcome = string1 + string2

	var instruction = "look over"
	instruction += string2

	let exclamationMark: Character = "!"
	welcome.append(exclamationMark)
	// welcome now equals "hello there!"
**通过 append(“需要放在后面的参数”) 函数，可以将 character 值添加到 string 后**



###String Interpolation
**String插入**

	let multiplier = 3
	let message = "\(multiplier) time 2.5 is \(Double(multiplier) * 2.5)"
	print(message)
**注意右斜杠上网转换作用，不同类型的值不可做乘除法 multiplier 系统默认是 Int， 2.5 是 Double**




###Unicode
#####Unicode Scalars
**Unicode标量，不是所有的 21-bit Uniocde 标量都被分配为一个 character ，有些是储备到以后在分配，已被分配的标量会有一个名字，比如 对于U+0061， LATIN SMALL LETTER A 就是 a；对于U+1F425，FRONT-FACING BABY CHICK 就是 🐥。**



###Special Characters in String Literals
**字符串会包含如下特殊对象**
**The escaped special characters \0 (null character), \\ (backslash), \t (horizontal tab), \n (line feed), \r (carriage return), \" (double quote) and \' (single quote)**

	print("空对象:\0 1;","反斜杠:\\ 2;","字符缩进:\t 3;","换行:\n 4;","回车:\r 5;","双引号:\" 6;","单引号:\' 7")

**An arbitrary Unicode scalar, written as \u{n}, where n is a 1–8 digit hexadecimal number with a value equal to a valid Unicode code point**
**\u{n},n 最多为5为哈希值,没有的对应对象为 𝇑（此处没有显示，实际上就是方框里面一个问号的图标）**

	let wiseWords = "\"Imagination is more important than knowledge\" -Einstein"
	print(wiseWords)
	// "Imagination is more important than knowledge" - Einstein
	
	let dollarSign = "\u{24}"
	print(dollarSign)
	// $,  Unicode scalar U+0024
	
	let blackHeart = "\u{2665}"
	print(blackHeart)
	// ♥,  Unicode scalar U+2665
	
	let sparklibgHeart = "\u{1F496}"
	print(sparklibgHeart)
	// 💖, Unicode scalar U+1F496
	
	print("\u{23}","\u{25}","\u{2664}")
	//# % ♤




###Extended Grapheme Clusters
**每个 swift 的 character 的实例都是一个单一的 extended grapheme cluster（“扩展的单层群体”），An extended grapheme cluster 可以分为一个或多个Unicode标量**

	let eAcute:Character = "\u{E9}"
	print(eAcute)
	//é

	let combinedEAcute:Character = "\u{65}\u{301}"
	print(combinedEAcute)	
	//é

	let precomposed:Character = "\u{D55C}"
	print(precomposed)
	// 한

	let decomposed1 = "\u{1112}"
	let decomposed2 = "\u{1161}"
	let decomposed3 = "\u{11AB}"
	let decomposed = "\u{1112}\u{1161}\u{11AB}"
	print(decomposed1,decomposed2,decomposed3,decomposed)
	// ᄒ ᅡ ᆫ 한

	let enclosdEAcute:Character = "\u{E9}\u{20DD}"
	print(enclosdEAcute)
	//é⃝
**Extended grapheme clusters 允许被关闭符号组成一个新的单一对象值**

	let regionalIndicarorForUS:Character = "\u{1F1FA}\u{1F1F8}"

	print(regionalIndicarorForUS,"\u{1F1F0}","\u{1F1F1}","\u{1F1F2}","\u{BAABb}","\u{1A1A0}","\u{1B1B1}","\u{1C1C1}","\u{1D1D1}")



###Counting Characters
**为了取回在一个字符串中对象值得数量，使用字符串的 characters 的 count 属性**

	let unusualMenagerie = "Koale 🐨,Snail 🐌,Penguin 🐧,Dromdary  🐪"
	print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
	//空格也算个数了

	var word = "cafe"
	print("the number of characters in \(word) is \(word.characters.count)")
	
	word += "\u{301}"
	print("the number of characters in \(word) is \(word.characters.count)")

	word += "111"
	print("the number of characters in \(word) is \(word.characters.count)")

	word += "\u{22222}"
	print("the number of characters in \(word) is \(word.characters.count)")
	
	//注意 word 的值，第一次是 cafe ,对象个数时4;
	//              第二次是 café ,当然个数海事4;
	//              第三次是 café111 ,对象个数是7了;
	//              第四次是 café111𢈢 ,对象个数是8;
	//计算字符串长度时，注意字符串最后变成多少来计算，因为有的 Extended grapheme clusters 不会改变字符串的长度，总的来说就是对\u{n}的认知，\u{n} 可能不是一个普通对象，它可能增加字符串长度，也有可能只改变了字符串中的某个对象




###Accessing and Modifying a String 
#####String Indices
**swift 不能用 integer 数值来给字符串中某个对象确定位置**

**startIndex endIndex predecessor()“前” successor()“后” advancedBy(_:)**

	let greeting = "Guten Tag!"
	print(greeting[greeting.startIndex])
	//print(greeting[greeting.endIndex])
	print(greeting[greeting.endIndex.predecessor()])
	print(greeting[greeting.startIndex.successor()])
	//print(greeting[greeting.startIndex.predecessor()])
	print(greeting[greeting.startIndex.advancedBy(4)])
	print(greeting.startIndex,greeting.endIndex)
	//Guten Tag! 长度是10，但是 ! 的位置是9，所以找第10位会报错，同样找首位的前一位也会报错；
	//startIndex 为 0 ，endIndex 为 字符串长度

	for index in greeting.characters.indices {
    	print("\(greeting[index]) ", terminator: "")
	}
	//prints"G u t e n   T a g ! "
**由于 Swift 2 将 print 和 println 合并了，并且默认的行为是 println，所以如果你不想自动在字符串末尾添加 new line 的话，就需要使用 terminator 参数来指定字符串的结尾。**


#####Inserting and Removing
	var welcome2 = "hello"
	welcome2.insert("!", atIndex: welcome2.endIndex)
	print(welcome2)
	//hello!

	welcome2.insertContentsOf(" there".characters, at: 	welcome2.endIndex.predecessor())
	print(welcome2)
	//hello there!

	welcome2.removeAtIndex(welcome2.endIndex.predecessor())
	print(welcome2)
	//hello there

	let range2 = welcome2.endIndex.advancedBy(-6)..<welcome2.endIndex
	welcome2.removeRange(range2)
	print(welcome2)
	//hello




###Comparing Strings
**swift 提供三种比较值的大小: 1.字符串，对象相等 2.前缀相等 3. 后缀相等**

#####1.String and Character Equality
###### ==  != 

	let qutoation = "We're a lot alike,you and I."
	let samequtation = "We're a lot alike,you and I."
	if qutoation == samequtation {
    	print("These two strings are considered equal!")
	}
	// Prints "These two strings are considered equal"

	// "Voulez-vous un café?" using LATIN SMALL LETTER E WITH ACUTE
	let eAcuteQuestion = "Voulez-vous un caf\u{E9}?"

	// "Voulez-vous un café?" using LATIN SMALL LETTER E and COMBINING ACUTE ACCENT
	let combinedEAcuteQuestion = "Voulez-vous un caf\u{65}\u{301}?"

	if eAcuteQuestion == combinedEAcuteQuestion {
    	print("These two strings are considered equal")
	}
	// Prints "These two strings are considered equal"

	let latinCapitalLetterA: Character = "\u{41}"

	let cyrillicCapitalLetterA: Character = "\u{0410}"

	if latinCapitalLetterA != cyrillicCapitalLetterA {
    	print("These two characters are not equivalent",latinCapitalLetterA,cyrillicCapitalLetterA)
	}
	// Prints "These two characters are not equivalent A А"
	//尽管字面看起来相同，但是语意不同，\u{41} 用在英语中，\u{0410} 用在俄语中


#####2,3.Prefix and Suffix Equality
######hasPrefix(_:) hasSuffix(_:)

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

	var act1SceneCount = 0
	for scene in romeoAndJuliet {
    	if scene.hasPrefix("Act 1 ") {
        	act1SceneCount += 1
    	}
	}
	print("There are \(act1SceneCount) scene in Act 1")

	var act9SceneCount = 0
	for scene in romeoAndJuliet {
    	if scene.hasSuffix("mansion") {
        	act9SceneCount += 1
    	}
	}
	print("There are \(act9SceneCount) scene in mansion")




###Unicode Representations of Strings
**字符串的编码呈现**

	let dogString = "Dog‼🐶"
	//utf8
	for codeUnit in dogString.utf8 {
    	print("\(codeUnit) ",terminator:"")
	}
	//68 111 103 240 159 144 182
	
	print("")

	//utf16
	for codeUnit in dogString.utf16 {
    	print("\(codeUnit) ",terminator:"")
	}
	//68 111 103 55357 56374

	print("")

	//scalar 标量
	for scalar in dogString.unicodeScalars {
    	print("\(scalar.value) ",terminator:"")
	}
	//68 111 103 128054
**上面那个双感叹号是一体的你敢信, ‼ 和 !!(英文) 和 ！！(中文)**





