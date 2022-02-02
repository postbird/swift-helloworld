
// string 类型拼接
let 🐶 = "dog";
let 🐱 = "cat";
let 🐶🐱🐱 = 🐶 + 🐱 + 🐱;
print("🐶🐱🐱 \(🐶🐱🐱)");

// 溢出计算
let a: UInt8 = 1;
let b: UInt8 = 255;
let c = a &+ b;
print(c);


// 一元减号运算符（改变正负） 一元加号运算符（啥也不做）
let aa = 6;
let aa2 = -aa;
print("\(aa) \(aa2) \(+aa2) \(-aa) \(-aa2)");

// 三元条件运算符
var optStr_1: String!;
let extStr_1: String = (optStr_1 != nil) ? optStr_1 : "default";
print("extStr_1 \(extStr_1) optStr_1 \(optStr_1)");

// 合并空值运算符 ??
let extStr_2 = optStr_1 ?? "default2";
print("extStr_2 \(extStr_2)");

// 区间操作符
// 封闭区间操作符
for i in 0...3 {
    print("i is \(i)");
}
print("---");
// 半开区间操作符
for i in 0..<3 {
    print("i is \(i)");
}
print("---");
// 单侧区间
let names = ["a", "b", "c", "d"];
for i in names[...2] {
    print("i is \(i)");
}
print("---");
for i in names[2...] {
    print("i is \(i)");
}
print("---");
for i in names[..<2] {
    print("i is \(i)");
}
// 逻辑运算符
let num_1 = 2;
let num_2 = -1;
if(num_1 > 0 || num_2 > 0) {
    print(true);
} else {
    print(false);
}

if(num_1 > 0 && num_2 > 0) {
    print(true);
} else {
    print(false);
}
