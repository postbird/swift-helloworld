// 创建空字典
var dict1 = Dictionary<String, String>();
var dict2 = [String: String]();
print("dict1", dict1);

// 赋值
dict1["name"] = "ptbird";
dict1["age"] = String(18);
print("dict1", dict1);
// 清空 dict
dict1 = [:];
print("dict1", dict1);
// 字面量赋值
dict1 = ["name": "ptbird2", "age": "17"];
print("dict1", dict1);

// 访问和修改 Dict
print("dict1.count", dict1.count);
dict1 = [:];
print("dict1.isEmpty", dict1.isEmpty);
// updateValue 返回旧值
dict1 = ["name": "ptbird2", "age": "17"];
if let oldAge = dict1.updateValue("18", forKey: "age") {
    print("old age is", oldAge, "new age is", dict1["age"]);
} else {
    print("nothing changed", dict1);
}
// removeValue
if let removedValue = dict1.removeValue(forKey: "age") {
    print("remove value age is ", removedValue);
    print("dict is ", dict1);
}

// 遍历 dict
dict1["age"] = String(18);
for (value:value, key:key) in dict1 {
    print("item value is", value, ",", "item key is", key);
}
for (key, value) in dict1 {
    print("item value is", value, "key is", key);
}
// 遍历所有keys
for key in dict1.keys {
    print("item key is", key, "item value is", dict1[key], "item value exact is", dict1[key]!);
}
// 遍历所有 values
for val in dict1.values {
    print("item value is", val);
}

// 排序
let sortedKeys = dict1.keys.sorted();
print("sortedKeys", sortedKeys);
for key in sortedKeys {
    print("key is", key, "value is", dict1[key]!);
}


















