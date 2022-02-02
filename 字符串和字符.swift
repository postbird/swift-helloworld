
// 多行字符串字面量
let multipleStr_1 = """
hello,
  my name is lilei,
  how are you,
  i am fine, thank u!

""";
print(multipleStr_1);

// 特殊字符
let multipleStr_2 = """
\u{24}
\u{2665}
\u{1F496}
💖️
""";
print(multipleStr_2);

// 扩展字符串分隔符
let str_1 = #"aaa\nbbb\#nccc"#;
print(str_1);

// 空字符串
let empStr_1 = "";
let empStr_2 = String();
print(empStr_1.isEmpty);
print(empStr_2.isEmpty);

// 操作字符
let str_2 = "aaa🐱";
for i in str_2 {
    print("i is \(i)");
}
let str_arr_1:[Character] = ["C", "a", "t", "!", "🐱"]
let str_3: String = String(str_arr_1);
print(str_3);

// 字符串拼接
let str_4 = "start";
let str_5 = "end";
let str_6 = str_4 + "_" + str_5;
var str_7 = str_6; 
str_7.append("_newEnd");
print(str_7, str_6, str_4, str_5);

// 字符串插值
let num_1 = 2;
let str_8 = "num_1 * 2  = \(num_1 * 2)";
print(str_8);
let str_9 = #"\(num_1 * 2) = \#(num_1 * 2)"#;
print(str_9);

// 扩展字形集群
let eAcute: Character = "\u{E9}";
let combinedEAcute: Character = "\u{65}\u{301}";
print(eAcute, combinedEAcute);
let precomposed: Character = "\u{D55C}" // 한
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ
print(precomposed, decomposed);

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}";
print(regionalIndicatorForUS, "🇺🇸");

// 字符统计
let unusualMenagerie_1 = "Koala 🐨 \u{D55C} \u{1112}\u{1161}\u{11AB}"; // 11
print(unusualMenagerie_1.count);
let unusualMenagerie_2 = "Koala 🐨 \u{D55C} \u{1112} \u{1161} \u{11AB}"; // 15
print(unusualMenagerie_2.count);

// 字符串索引
let str_10 = "Cat🐱";
print(str_10.startIndex, str_10.endIndex);
print(str_10[str_10.index(before: str_10.endIndex)]); // 🐱
print(str_10[str_10.index(after: str_10.startIndex)]); // a
//print(str_10[str_10.index(before: str_10.startIndex)]); // error

// 获取精确位置的字符
let index_1 = str_10.index(str_10.startIndex, offsetBy: 1);
print("index_1 is", index_1, "str_10[index_1]", str_10[index_1]);

// 插入和删除字符
var str_11 = "Hello, World";
// 插入单个字符
str_11.insert("!", at: str_11.endIndex);
print("str_11:", str_11);
// 插入字符串
str_11.insert(contentsOf: "🐱🐱🐱🐱", at: str_11.endIndex);
print("str_11:", str_11);
// 移除单个字符
str_11.remove(at: str_11.index(str_11.startIndex, offsetBy: 5));
print("str_11:", str_11);
// 移除某个区间
let range_1 = str_11.index(str_11.endIndex, offsetBy: -4) ..< str_11.endIndex; 
str_11.removeSubrange(range_1);
print("str_11:", str_11);

// 获取某个字符的 index
var str_12 = "Cat!🐱🐱";
let index_3 = str_12.index(of: "🐱");
let index_4 = str_12.index(of: "猫") ?? str_12.index(before: str_12.endIndex);
print("index_3", index_3);
print("index_4", index_4);
str_12.replaceSubrange(index_4..<str_12.index(after:index_4), with: "🐶");
print("str_12", str_12);
print("str_12[...index_4]", str_12[...index_4]);

// 子字符串
var str_13 = "Cat!🐱";
var sub_str_13 = str_13[...str_13.index(str_13.endIndex, offsetBy: -3)];
print("sub_str_13", sub_str_13);
sub_str_13.append(contentsOf: "🐶🐶");
print("sub_str_13", sub_str_13, "str_13", str_13); // sub_str_13 Cat🐶🐶 str_13 Cat!🐱
//str_13[...str_13.index(str_13.endIndex, offsetBy: -3)].append("狗头");
//print(str_13);

// 字符串比较
let str_14 = "aaa";
let str_15 = "bbb";
print(str_14 == str_15, str_14 == "aaa");

// 前缀后缀
let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
];

var actlSceneCount = 0;
for scene in romeoAndJuliet {
    if(scene.hasPrefix("Act 1")){
        actlSceneCount += 1;
    }
}
print("actlSceneCount", actlSceneCount);


