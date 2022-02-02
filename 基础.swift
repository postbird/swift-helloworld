print("hello world");
// 常量/变量/类型
var a: Double = 24;
let b: Double = 23;
print(a + b);
a = 0;
print(a + b);
a = 1.1;
print(a + b);
// 字符串模板插值
let sum = a + b;
let message = "I have \(sum) apples!";
print(message);
// 可选值 optional 值 表明可能有值也可能是 nil
let optionalInt: Int? = 3;
print(optionalInt);
print(optionalInt!); // 强制解 optional 值
var msg = "2";
var msgInt: Int? = Int(msg);
var msgInt2 = Int(msg);
// 隐式解包
var msgInt3: Int!;
print(msgInt! + msgInt2!);
msgInt3 = nil;
print(msgInt3);
msg = "aa";
print(msgInt);
msgInt = Int(msg);
print(msgInt);
// 数组
var ratingList = ["Poor","Fine","Good","Excellent"];
print(ratingList);
print(ratingList[0]);
// print(ratingList[10]); // index out of range
// 空数组
var emptyList = [String](["a"]);
// if 语句
var num = 3;
if( num < 3 ) {
    num = num + 1;
} else if ( num >= 3 ) {
    num = num + 2;
} else {
    print("if-else")
}
print("num is \(num)");
// if 使用 optional 变量
var optionalName: String? = "ptbird";
//optionalName = nil;
var greeting = "hello \(optionalName!)";
print(greeting);
if(optionalName != nil) {
    optionalName = nil;
    print(optionalName);
}

if let name = optionalName {
    print("name is \(name)")
    print(greeting);
} else {
    optionalName = "heihei"
    print(greeting);
}
// 多个条件使用 , 分割
// 匹配赋值需要显示的指定赋哪个变量的值
var optionalHello: String? = "Hello";
if let hello = optionalHello , hello.hasPrefix("H") {
    print("\(hello) \(optionalName!)");
}
// switch 
// 使用匹配赋值 多个的条件需要使用 where 表达式
// 匹配赋值不需要显示使用 = 变量赋值，默认会赋值当前 swtich 变量值
let vegetable = "red papper";
switch vegetable {
case "celery":
    let vagetableComment = "Add some raisins and make ants on a log.";
case "cucumber","waterrcress":
    let vegetableComment = "That would make a good tea sandwich."
case let x  where x.hasSuffix("papper"): 
    print(x);
    let vegetableComment = "Is it a spicy \(x)";
    print(vegetableComment);
default:
    let vegetableComment = "Everything tasts good in soup.";
    print(vegetableComment);
}
// for 循环 - 半开范围操作符
var firstForLoop = 0;
for i in 0..<4 {
    firstForLoop += i;
    print("Current firstForLoop \(firstForLoop)");
}
print("Finaly firstForLoop \(firstForLoop)");
// for 循环 (_)通配符
// 封闭范围操作符
firstForLoop = 0;
for _ in 0...4 {
    firstForLoop += 1;
    print("Current firstForLoop \(firstForLoop)");
}
print("Finaly firstForLoop \(firstForLoop)");




