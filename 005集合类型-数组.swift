
// 空数组
var someInts = [Int]();
print("someInt.count",someInts.count);
someInts.append(2);
print("someInt.count",someInts.count);
someInts = [];
print("someInt.count",someInts.count);

// 默认值创建数组
var threeDoubles = Array(repeating: 0.0, count: 3);
print("threeDoubles", threeDoubles);
var moreInts = Array(repeating: 1, count:1000);
print("moreInts.count", moreInts.count);

// + 计算数组拼接成新数组
let threeDoubles2 = threeDoubles + threeDoubles;
print("threeDoubles2", threeDoubles2);


// 访问和修改数组
var shoppingList = ["Eggs", "Milk"];
// 判断数组为空
if(shoppingList.isEmpty) {
    print("shoppingList is Empty");
} else {
    print("shoppingList is not Empty");
}
// += 计算
shoppingList += ["Cheese"];
print("shoppingList +=", shoppingList);
//访问下标
print("shoppingList[0]", shoppingList[0]);
// 区间取值
print("shoppingList[1...2]", shoppingList[1...2]);
print("shoppingList[1..<2]", shoppingList[1..<2]);
// 区间赋值
var subShoppingList = shoppingList[1...2];
print("subShoppingList", subShoppingList);
subShoppingList.reverse();
print("subShoppingList", subShoppingList);
shoppingList[1...2] = subShoppingList;
print("shoppingList", shoppingList);
// insert 插入
shoppingList.insert("Apples", at: 0);
print("shoppingList", shoppingList);
// remove 移除
shoppingList.remove(at: 0);
print("shoppingList", shoppingList, "shoppingList[0]:", shoppingList[0]);
// removeLast 移除最后一个元素
var shoppingLast = shoppingList.removeLast();
print("shoppingList", shoppingList, "shoppingLast:", shoppingLast);
// removeAll
shoppingList.removeAll();
print("shoppingList", shoppingList);
