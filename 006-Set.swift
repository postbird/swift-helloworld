
// 集合 hashValue
let a = 1;
let b = 1;
print(a.hashValue == a.hashValue);
print(a.hashValue == b.hashValue);

// 空集合
var letters = Set<Character>();
print("letters.count", letters.count);
letters.insert("a");
print("letters.count", letters.count, letters);
letters = [];
print("letters.count", letters.count, letters);

// 字面量创建 Set
var favoriteGenres: Set<String> = ["Rock", "Classical"];
print(favoriteGenres);
//var set_1: Set = [1, 2]; // 简写

// 访问和修改 Set
favoriteGenres.removeAll();
// 判断空
if(favoriteGenres.isEmpty) {
    print("empty");
    favoriteGenres.insert("Rock");
    favoriteGenres.insert("Classical");
    print("new favoriteGeners", favoriteGenres);
}
// remove
let remove_1: String! = favoriteGenres.remove("Rock");
let remove_2: String! = favoriteGenres.remove("Rock");
print("remove_1", remove_1, "remove_2", remove_2);
if let remove_3 = favoriteGenres.remove("Rock") {
    print("removed", remove_3);
}else {
    print("does not have", "Rock");
    favoriteGenres.insert("Apple");
}

// 排序
var sortedFavoriteGenres = favoriteGenres.sorted();
print("sorted", sortedFavoriteGenres);

// 遍历set_1
for item in sortedFavoriteGenres {
    print("item is", item);
}

// Set 基本操作
let set_1: Set = [1, 2];
let set_2: Set = [2, 3];
// 取交集
let intersection_set = set_1.intersection(set_2);
print("intersection_set", intersection_set);
// 取并集
let union_set = set_1.union(set_2);
print("union_set", union_set.sorted());
// 取对称性差异
let symmeterDifference_set = set_1.symmetricDifference(set_2);
print("symmeterDifference_set", symmeterDifference_set);
// 从一个 Set 中移除与另外一个 Set 的交集
let subtracting_set = set_1.subtracting(set_2);
print("subtracting_set", subtracting_set);

// Set 成员关系和相等性
let houseAnimals: Set = ["🐶", "🐱"];
let houseAnimals_2: Set = ["🐶", "🐱"];
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"];
let cityAnimals: Set = ["🐦", "🐭"];

// isSubset 判断一个 Set 是另外一个 Set 的子集
let isSubset_1 = houseAnimals.isSubset(of: farmAnimals);
print("isSubset_1", isSubset_1);
let isSubset_2 = farmAnimals.isSubset(of: houseAnimals);
print("isSubset_2", isSubset_2);
let isSubset_3 = houseAnimals.isSubset(of: houseAnimals_2);
print("isSubset_3", isSubset_3);
// isSuperset 判断一个 Set 是另外一个 Set 的超集
let isSuperset_1 = farmAnimals.isSuperset(of: houseAnimals);
print("isSuperset_1", isSuperset_1);
// isStrictSubset 绝对子集
let isStrictSubset_1 = houseAnimals.isStrictSubset(of: houseAnimals_2);
print("isStrictSubset_1", isStrictSubset_1);
let isStrictSubset_2 = houseAnimals.isStrictSubset(of: farmAnimals);
print("isStrictSubset_2", isStrictSubset_2);
// isDisjoint 两个集合没有交集
let isDisjoint_1 = houseAnimals.isDisjoint(with: houseAnimals);
print("isDistjoint_1", isDisjoint_1);
let isDisjoint_2 = houseAnimals.isDisjoint(with: cityAnimals);
print("isDistjoint_2", isDisjoint_2);










