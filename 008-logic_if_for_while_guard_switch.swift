// 区间运算符
let minutes_1 = 60;

//for tickMark in 0..<minutes_1 {
//    print("tickMark", tickMark);
//}

// stride 间隔遍历
let interval = 5;
var arr_1 = [Int]();
// 开区间 stride
for tickMark in stride(from: 0, to: minutes_1, by: interval) {
    arr_1.append(tickMark);
//    print("tick mark", tickMark);
}
print("tick mark", arr_1);
// 闭区间 stride
arr_1.removeAll();
for tickMark in stride(from: 0, through: minutes_1, by:interval) {
//    print("tick mark", tickMark);
    arr_1.append(tickMark);
}
print("tick mark", arr_1);


// while 循环
var i = 0;
arr_1.removeAll();
while (i <= 60) {
    if (i % interval == 0) {
        arr_1.append(i);
    }
    i += 1;
}
print("tick mark", arr_1);

// 蛇与梯子游戏
var square = 0;
var final = 25;
var board = [Int](repeating: 0, count: final + 1);
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02;
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08;
var squareList = [Int]();
while(square < final) {
    let roll = Int.random(in: 1...6)
    square += roll;
    if square < board.count, let currentBoard = Optional(board[square]) {
        square += currentBoard;
    }
    squareList.append(square);
}
print("square is", square, squareList);

// repeat-while
var item_1 = 0;
repeat {
    print("item", item_1);
    item_1 += 1;
}while(item_1 < 3);

// switch
let str_1 = "Apple";
switch (str_1.lowercased()) {
case "Apple", "apple": 
    print("Hi, a apple");
default: 
    print("not found");
}
// switch 区间匹配
let num_1 = 101;
switch(num_1) {
case 0..<100:
    print("small");
case 101...999:
    print("middle");
default: 
    print("large"); 
}
// switch 元组解构匹配
let pos = (x: 101, y: -101);
switch (pos) {
case (_, -200...999):
    print("y");
case (101, _):
    print("x");
default:
    print("not found");
}
// switch 值绑定
switch (pos) {
case (let x, (-200)...(-100)):
    print("x is", x);
case (100...200, let y):
    print("y is", y);
default: 
    print("not found");
}
// switch where 子句
switch (pos) {
case (let x, let y) where x > y:
    print("x>y", x, y);
case (let x, let y) where x <= y: 
    print("x<y", x, y);
default: 
    print("not found");
}

// 控制转移
// continue break
for item in 0...10 {
    if item % 2 == 0 {
        continue;
    }
    if item > 4 {
        break;
    }
    print("item is", item);
}

// switch 忽略匹配 break
switch (pos) {
case (let x, _): 
    break;
default: 
    break;
} 

// switch 持续匹配 fallthrough
let num_2 = 4;
switch (num_2) {
case let x where x > 0:
    print(">0");
    fallthrough;
case let x where x % 2 == 0:
    print("%2");
    fallthrough;
default: 
    break;
}

// guard 语句
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    
    print("I hope the weather is nice in \(location).")
}

greet(person: ["name": "John"])
// Prints "Hello John!"
// Prints "I hope the weather is nice near you."
greet(person: ["name": "Jane", "location": "Cupertino"])
// Prints "Hello Jane!"
// Prints "I hope the weather is nice in Cupertino."

// api 可用性校验
if #available(iOS 10, *) {
    print("available");
}










