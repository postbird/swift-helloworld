// 枚举
enum Fruit {
    case A
    case B
    case C
    case D
}

print(Fruit.A.hashValue);

var fruitA: Fruit = Fruit.A;
fruitA = .B;
switch(fruitA) {
case .A: 
    print("i am A");
default:
    print("do not found any");
}

// 遍历
enum Enum_1: CaseIterable {
    case a, b, c, d;
}
print(Enum_1.allCases);

for item in Enum_1.allCases {
    print("item is", item);
}

// 关联值
// 指定枚举类型
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var upcCode_1 = Barcode.upc(12, 12, 12, 12);
var qrCode_1 = Barcode.qrCode("xxa02kakas");
print("upcCode", upcCode_1);
print("qrCode", qrCode_1);
upcCode_1 = Barcode.qrCode("--123");
print("upcCode", upcCode_1);
// switch 匹配不同类型的枚举
switch (upcCode_1) {
case .upc(let num_1, let num_2, let num_3, let num_4):
    print("num_1 is", num_1);
    print("num_2 is", num_2);
    print("num_3 is", num_3);
    print("num_4 is", num_4);
case .qrCode(let qrc):
    print("is a qrCode", qrc);
}
// switch 提取枚举所有的值
switch (qrCode_1) {
case let .qrCode(qrc):
    print("qrc is", qrc);
default: 
    print("is not a qrc");
}

// 枚举默认值
// 默认值需要指定类型 并且类型一致
// 通过 rawValue 获取实际值
enum EnumName: String {
    case firstName = "Default First Name"
    case lastName = "Default Last Name"
} 
let userFirstName = EnumName.firstName;
print("userFirstName.rawValue", userFirstName.rawValue);

// 枚举默认值 和 rawValue 用法
enum HttpCode: Int {
    case success = 200
    case notFound = 404
    case serverError = 500
    case notAllowed = 401
}
var httpStatusCode = 200;
if(httpStatusCode != HttpCode.success.rawValue) {
    print("not success");
}else {
    print("http success", httpStatusCode);
}

// 从原始值(rawValue)初始化
var httpStatus_1 = HttpCode(rawValue: 200);
var httpStatus_2 = HttpCode(rawValue: 400);
var httpStatus_3 = HttpCode(rawValue: 500);
var httpStatus_4 = HttpCode(rawValue: 520);
print("http", httpStatus_1, httpStatus_2, httpStatus_3, httpStatus_4);

if(httpStatus_1 == HttpCode.success) {
    print("success", httpStatus_1);
}

// 递归枚举
indirect enum Expression {
    case number(Int)
    case increment(Expression, Expression)
    case multiplication(Expression, Expression)
}
// 模拟 (1+2)*2
var num_1 = Expression.number(1);
var num_2 = Expression.number(2);
var sum_1 = Expression.increment(num_1, num_2);
var num_3 = Expression.number(2)
var finalExpression = Expression.multiplication(sum_1, num_3);
print(finalExpression);
// 通过递归函数计算递归枚举表达式
func excuteExpression(_ expression: Expression) -> Int{
    switch (expression) {
    case .number(let num):
        return num;
    case let .increment(exp_left, exp_right):
        return excuteExpression(exp_left) + excuteExpression(exp_right);
    case let .multiplication(exp_left, exp_right):
        return excuteExpression(exp_left) * excuteExpression(exp_right);
    }
}

var res_1 = excuteExpression(finalExpression);
print("expression res is:", res_1);












