// 存储属性
struct FixedLengthRange {
    var start: Int;
    let length: Int;
}

var rangeOfThreeTimes = FixedLengthRange(start: 0, length: 3);
rangeOfThreeTimes.start = 6;

for name in rangeOfThreeTimes.start..<rangeOfThreeTimes.length + rangeOfThreeTimes.start {
    print("item is", name);
}

let rangeOfThreeTimes_1 = FixedLengthRange(start: 12, length: 2);
//rangeOfThreeTimes_1.start = 12;

// 延迟初始化
class DataImport {
    var fileName = "data.text";
}

class DataManager {
    lazy var importer = DataImport();
    var data = [String]();
}

let dataManager = DataManager();

print(dataManager.importer.fileName);

// 计算属性
struct Point {
    var x = 0.0;
    var y = 0.0;
}

struct Size {
    var width = 0.0, height = 0.0;
}

struct Rect {
    var origin = Point();
    var size = Size();
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2);
            let centerY = origin.y + (size.height / 2);
            return Point(x: centerX, y: centerY);
        }
        set(point) {
            origin.x = point.x;
            origin.y = point.y;
        }
    }
}

var rect = Rect()
rect.size.width = 100;
rect.size.height = 100;
print(rect.center);
rect.center = Point(x:101, y:101);
print(rect.origin);
print(rect.center);

// 只读计算属性

class Rect_1 {
    var width = 100, height = 100;
    var area: Int {
        return width * height;
    }
} 

let rect_1 = Rect_1();
print(rect_1.area);
rect_1.width = 1;
print(rect_1.area);

// 属性观察
class Rect_2 {
    var width = 0 {
        willSet(newWidth){
            print("width will change to be", newWidth);
        }
        didSet(oldWidth) {
            print("width changed", oldWidth, "to",  width);
            area = width * height;
        }
    }
    var height = 0 {
        willSet(newHeight){
            print("height will change to be", newHeight);
        }
        didSet(oldHeight) {
            print("height changed", oldHeight, "to",  height);
            area = width * height;
        }
    }
//    var area:Int {
//        return width * height;
//    }
    var area = 0;
}
let rect_2 = Rect_2();
rect_2.width = 100;
rect_2.height = 100;
print(rect_2.area);

// 属性包装 - 抽离定义与逻辑
@propertyWrapper
struct TwleveOrless {
    private var number = 0;
    var wrappedValue: Int {
        get { return number; }
        set (num) {
            if (num < 0) {
                number = 0;
            }else {
                number = min(num, 12);
            }
        }
    }
}

class SmallRect {
    @TwleveOrless var height;
    @TwleveOrless var width;
    var area: Int {
        return width * height;
    }
}

var smallRect_1 = SmallRect();
smallRect_1.width = 24;
smallRect_1.height = 12;
print(smallRect_1.area);
smallRect_1.width = -24;
print(smallRect_1.area);

// 不使用注解进行属性包装
class SmallRect_2 {
    private var _width = TwleveOrless();
    private var _height = TwleveOrless();
    
    var width: Int {
        get { return _width.wrappedValue }
        set(value) {
            _width.wrappedValue = value;
        }
    }
    
    var height: Int {
        get { return _height.wrappedValue }
        set(value) {
            _height.wrappedValue = value;
        }
    }
    
    var area:Int {
        return width * height; 
    }
}

let smallRect_2 = SmallRect_2();
smallRect_2.width = 100;
smallRect_2.height = 100;
print(smallRect_2.area);


// 属性包装初始值
@propertyWrapper
struct SmallNumber {
    private var maximum: Int;
    private var num: Int;
    
    var wrappedValue: Int {
        get { return num; }
        set(newNum) { num = min(newNum, maximum) }
    }
    
    init(){ 
        maximum = 0;
        num = 0;
    }
    
    init(_ _maximum: Int) {
        maximum = _maximum;
        num = min(maximum, 0);
    }
    
    init(wrappedValue: Int) {
        maximum = 12;
        num = min(maximum, wrappedValue);
    }
    
    init(_ _maximum:Int, _ _num: Int) {
        maximum = _maximum;
        num = min(_maximum, _num)
    }
}

var smallNum_1 = SmallNumber();
print(smallNum_1.wrappedValue);
smallNum_1 = SmallNumber(wrappedValue: 12);
print(smallNum_1.wrappedValue);
smallNum_1 = SmallNumber(12, 14);
print(smallNum_1.wrappedValue);

struct UnitRectangle {
    @SmallNumber var width: Int = 12;
    @SmallNumber var height: Int = 13;
    
    var area: Int {
        return width * height;
    }
}

// 通过注解初始化属性
struct UnitRectangle_2 {
    @SmallNumber(12, 3) var height: Int;
}

var unitRect_2 = UnitRectangle_2();
print(unitRect_2.height);
unitRect_2.height = 24;
print(unitRect_2.height);

// 通过属性包装映射值
@propertyWrapper
struct SmallNumer_2 {
    private var number: Int = 0;
    var projectedValue: Int = 0;
    var wrappedValue: Int {
        get { number }
        set {
            if(newValue > 12) {
                number = 12;
            }else {
                number = newValue;
            }
            projectedValue = number * 10;
        }
    }
    
    // ! 这里必须显示声明一个构造方法 否则会报错
    init(){
        wrappedValue = 0;
    }
}

class SmallRect_3 {
    @SmallNumer_2 var width: Int;
}

let smallRect_3 = SmallRect_3();
smallRect_3.width = 200;
print("smallRect_3.width", smallRect_3.width);
print("smallRect_3.$width", smallRect_3.$width);

// 类型属性 - 静态属性
struct Struct_1 {
    static var defaultWidth = 12;
    static var defaultHeight = 12;
    var height = defaultWidth;
    var width = defaultHeight;
    
    var area:Int {
        return width * height;
    }
    
    var defaultArea: Int {
        return Struct_1.defaultHeight * Struct_1.defaultWidth;
    }
}

var struct_1 = Struct_1();

print("struct_1.width", struct_1.width);
print("Struct_1.defaultWidth", Struct_1.defaultWidth);
print("struct_1.area", struct_1.area);
print("struct_1.defaultArea", struct_1.defaultArea);

Struct_1.defaultWidth = 100;
print("struct_1.width", struct_1.width);
print("Struct_1.defaultWidth", Struct_1.defaultWidth);
print("struct_1.area", struct_1.area);
print("struct_1.defaultArea", struct_1.defaultArea);













