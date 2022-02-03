// 全局函数是一个有名字但不会捕获任何值的闭包；
// 内嵌函数是一个有名字且能从其上层函数捕获值的闭包；
// 闭包表达式是一个轻量级语法所写的可以捕获其上下文中常量或变量值的没有名字的闭包。

// 闭包表达式
let nums = [1, 5, 2, 3, 6, 1, 3, 4];
var sortedNums: [Int] = nums;
sortedNums = nums.sorted();
print(sortedNums);
sortedNums = nums.sorted(by: { (a: Int, b: Int) -> Bool in return a > b });
print(sortedNums);

// 闭包表达式类型推断、隐式返回值
sortedNums = nums.sorted(by: { (a, b) in a > b });
print(sortedNums);

// 简写比表表达式实际参数名
sortedNums = nums.sorted(by: { $0 > $1 });
print(sortedNums);

// 运算符函数
sortedNums = nums.sorted(by: >);
print(sortedNums);

// 运算符函数
func operate_1 (_ f: (_ a: Int, _ b: Int) -> Int) -> Int {
    let num_1 = 1;
    let num_2 = 2;
    return f(num_1, num_2);
}
var res: Int = operate_1(+); // + 等同 func (a: Int, b: Int) -> Int { return a + b };
print(res);
res = operate_1(-);
print(res);
res = operate_1(*);
print(res);

// 尾随闭包 - 不需要将闭包入参 挂载函数执行最后即可
res = operate_1 { $0 + $1 };
print(res);

// 尾随闭包排序
sortedNums = nums.sorted { $0 > $1 };
print(sortedNums);

// map 尾随闭包
var mapNums = nums.map  { $0 * 10 };
print(mapNums);

// 多个尾随闭包
func loadPicture(onSuccecss: (_ url: String) -> Any, onFailure: (_ url: String) -> Any) {
    print("heiheihei");
}

loadPicture() { print($0) } onFailure: { url in
    print(url)
}

// 捕获值
func incrementFactory(_ num: Int = 1) -> () -> Int {
    var total:Int = 0
    func doIncrement() -> Int {
        total += num;
        return total;
    }
    return doIncrement;
}

let increment_1 = incrementFactory(1);
let increment_2 = incrementFactory(10);
res = increment_1();
print("res is", res);
res = increment_1();
print("res is", res);
res = increment_2();
print("res is", res);
res = increment_2();
print("res is", res);


// 逃逸闭包
var funcQueue: [() -> Void] = [];
func funcQueueFactory (_ handler: @escaping () -> Void) {
    funcQueue.append(handler);
}
funcQueueFactory({});
funcQueueFactory({});
funcQueueFactory({});
print("funcQueue", funcQueue);

// 自动闭包 自动闭包之后，无需写 {} 声明这是一个闭包
var serveQueue = ["A", "B", "C", "D"];

// 没有声明自动闭包 需要主动传入一个闭包 
func serve(_ customerProvider: () -> String) {
    print("Now, serve \(customerProvider())", "All People:", serveQueue);
}
for _ in serveQueue {
    serve({ serveQueue.remove(at: 0) }); // 没有自动闭包的时候，需要手动声明一个闭包
}

serveQueue = ["A", "B", "C", "D"];
// 声明自动闭包
func serveAutoClouser(_ customerProvider: @autoclosure () -> String) {
    print("Now, serve \(customerProvider())", "All People:", serveQueue);
}
for _ in serveQueue {
    serveAutoClouser(serveQueue.remove(at: 0)); // 已经声明了自动闭包，可以直接省略 { }
}

// 允许逃逸的自动闭包
var servePeopleQueue = ["A", "B", "C", "D"];
var serveActionQueue: [() -> String] = [];
func serveEscapingAutoFactory(_ customerProvider: @escaping @autoclosure () -> String) {
    serveActionQueue.append(customerProvider);
}
for _ in servePeopleQueue {
    serveEscapingAutoFactory(servePeopleQueue.remove(at: 0));
}
for action in serveActionQueue {
    print("Now serve:", action(), "All people:", servePeopleQueue);
}



