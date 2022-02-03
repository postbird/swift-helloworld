// 基本函数定义和入参
func greet_1(person: String?) -> String{
    if(person == nil) {
        return "hello, Somebody";
    }
    return "hello, \(person)";
}
print(greet_1(person: "Alen"));
print(greet_1(person: nil));


// 形参和返回值
// 无形式参数
func sayHelloWorld () -> String {
    return "Hello World!";
}
print(sayHelloWorld());
// 多形参
var alreadyGreeted = false;
func greet_2(person: String, alreadyGreeted: Bool) -> (String, Bool) {
    if(alreadyGreeted){
        return ("How are you?", false);
    }
    return ("Hello, \(person)!", true);
}
let (msg_1, result_1) = greet_2(person: "alen", alreadyGreeted: alreadyGreeted);
print(msg_1);
alreadyGreeted = result_1;
let (msg_2, result_2) = greet_2(person: "alen", alreadyGreeted: alreadyGreeted);
print(msg_2);

// 多返回值
func getMinMax(list: [Int]) -> (min: Int, max: Int) { 
    let newList = list.sorted();
    return (min: newList[0], max: newList[newList.endIndex - 1]);
}

print(getMinMax(list: [1,2,6,2,1,2]));

// 可选元组返回类型
func getMinMax_2(list: [Int]) -> (min: Int, max: Int)? { 
    let newList = list.sorted();
    if (newList.count == 0) {
        return nil;
    }
    return (min: newList[0], max: newList[newList.endIndex - 1]);
}
let result = getMinMax_2(list: []);
print("min,max", result?.min ?? "--", result?.max ?? "--");

// 隐式返回值
func greet_3() -> Int {
//    "hello world!";
    2;
}
print(greet_3());

// 形参标签（形参别名）
var person = (name: "ptbird", age: 18);
func greet_4(name userName: String, age: Int) -> String {
    return "Hello, \(userName), your age is \(age)";
}
print(greet_4(name: person.name, age: person.age));

// 省略实参标签
person = (name: "ptbird", age: 18);
func greet_5(_ name: String, _ age: Int) -> String {
    return "Hello, \(name), your age is \(age)";
}
print(greet_5(person.name, person.age));

// 函数参数默认值
var person_2 = (name: "ptbird", sex: "f");
var person_3 = (name: "ptbird2", sex: "m", age: 24);
func greet_6  (_ name: String, sex: String, age: Int = 18) -> String {
    return "Hello, \(name), your sex is \(sex), and your age is \(age)";
}
print(greet_6(person_2.name, sex: person_2.sex));
print(greet_6(person_3.name, sex: person_3.sex, age: person_3.age));

// 可变形参
func getAverage(_ numbers: Double...) -> Double {
    print("numbers is", numbers)
    print("numbers.count is", numbers.count);
    
    if(numbers.count == 0) {
        return 0.0;
    }
    
    var sum: Double = 0;
    for num in numbers {
        sum += num ?? 0.0;
    }
    let avg = sum / Double(numbers.count);
    return avg;
}

print(getAverage(1, 2, 3, 4, 5));
print(getAverage(1, 2, 3));
print(getAverage());

// 输入输出形式参数 --- 在函数内部改变值
var alreadyGreeted_1 = false;
var name = "ptbird";
func greet_7(_ name: inout String, _ alreadyGreeted: inout Bool){
    let oldName = name;
    
    if (name == "ptbird") {
        name = "ptbird2";
    } else {
        name = "ptbird";
    }
    
    if(alreadyGreeted) {
        print("How are you, \(oldName)");
    } else {
        print("Hello, \(oldName), nice to meet you!");
    }
    alreadyGreeted = !alreadyGreeted;
}
// 调用必须在实参前面加 &
greet_7(&name, &alreadyGreeted_1);
greet_7(&name, &alreadyGreeted_1);
greet_7(&name, &alreadyGreeted_1);
print(greet_7(&name, &alreadyGreeted_1));

// 交换值
var num_1 = 1;
var num_2 = 2;
func swap(_ num_1: inout Int, _ num_2: inout Int) -> Void {
    let tmpNum = num_1;
    num_1 = num_2;
    num_2 = tmpNum;
}

swap(&num_1, &num_2);
print(num_1, num_2);

// 函数作为返回值
func greetFactory(_ helloPrefix: String = "Hello") -> (_ name: String) -> String {
    func _greet(_ name: String) -> String {
        return "\(helloPrefix),\(name)";
    }
    return _greet;
} 

let greetFunc_1 = greetFactory();
let greetFunc_2 = greetFactory("How are you");
print(greetFunc_1("alen"));
print(greetFunc_2("alen"));

// 内嵌函数
func greet_8(_ isMale: Bool = true) {
    let prefix = "Hello";
    
    func greetMale(){
        print("\(prefix), Male");
    }
    
    func greetFemale(){
        print("\(prefix), Female")
    }
    
    isMale ? greetMale() : greetFemale();
}

greet_8(true);
greet_8(false);



