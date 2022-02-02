let 🐶 = "dog";
let 🐱 = "cat";
print("\(🐶) \(🐱)");

// 整数
let num = 42; // 默认是 Int 类型 32 位系统中 Int32 64位系统中 Int64
print(num);
let num2: Int32 = 42;
print(num2);

var minValue = UInt8.min;
var maxValue = UInt8.max;
print("UInt8 minValue: \(minValue)");
print("UInt8 maxValue: \(maxValue)");

print("Int16 minValue: \(Int16.min)");
print("Int16 maxValue: \(Int16.max)");

print("Int32 minValue: \(Int32.min)");
print("Int32 maxValue: \(Int32.max)");

print("Int64 minValue: \(Int64.min)");
print("Int64 maxValue: \(Int64.max)");

// 无符号整型
print("UInt.min \(UInt.min)");
print("UInt.max \(UInt.max)");

// 浮点数
let floatNum:Float = 2.12345678912345678;
print("floatNum \(floatNum)");

let doubleNum: Double = 2.123456789123456789;
print("doubleNum \(doubleNum)");

// 十进制科学计数法
let expNum = 1.24e10;
print("expNum \(expNum)");

// 浮点数和整数转换
let dNum = 1.0;
let dInt = 2;
let sum1 = dNum + Double(dInt);
print(sum1);
let sum2 = Int(dNum) + dInt;
print(sum2);

// 类型别名
typealias AliasInt = UInt8;
print("AliasInt.min \(AliasInt.min)");

// Bool 类型
let trueValue = true;
let falseValue: Bool = false;
print(trueValue);
let boolVal = 1 > 2;
print(boolVal);

// 元组
let httpNotFound = (404, "Not Found");
print(httpNotFound);
// 元组解构
let (statusCode, statusMessage) = httpNotFound;
print("statusCode: \(statusCode), stautsMessage: \(statusMessage)");
// 只解构元组一个值
let httpServiceError = (500, "Service Error", "Not Found Stack");
let (statusCode2, _, _)=httpServiceError;
print(statusCode2);
// 通过元组索引直接使用元组中的一个值
print("statusCode \(httpServiceError.0)");
// 命名元组元素
var myCat = (name: "八喜", age: 1, sex: "f");
myCat.age = 2;
print("myCat's name is \(myCat.name)");
print("myCat's age is \(myCat.age)");
var myNewCat = myCat;
print(myNewCat == myCat); // true
myNewCat.age = 3;
print(myNewCat == myCat); // false

// 可选值
let optNum = "123";
let convertNum = Int(optNum);
print("\(optNum) \(convertNum) \(convertNum!)");

// nil
var optString: String?;
print(optString);
optString = "aaaoptString";
print(optString);

// 可选值隐式展开
var optStr_1: String?;
var optStr_2: String! = "b";
print("\(optStr_1) \(optStr_2)");

//optStr_2 = nil; // 隐式可选赋值 nil 后 不能直接赋值静态变量, 除非指定默认值
//let extStr_2: String = optStr_2 ?? "default_ext_str_2";

let extStr_1: String = optStr_1 ?? "default_ext_str_1";
let extStr_2: String = optStr_2;
print("\(extStr_1) \(extStr_2)");

optStr_1 = nil;
optStr_2 = nil;
print("\(optStr_1) \(optStr_2)");

// 错误处理
func canThrowAnError() throws {
    // this function may or may not throw an error
    let a: UInt8 = 255;
    let b: UInt8 = 1;
    print(a + b)
}

do {
    try canThrowAnError();
}catch {
    print("something error.")
}

// assert 断言
var intNum = 3;

assert(intNum > 2, "intNum > 2");
print("assert intNum_ >2");
assert(intNum < 2, "intNum < 2"); // 终端下面所有的执行
print("assert intNum_ <2");




