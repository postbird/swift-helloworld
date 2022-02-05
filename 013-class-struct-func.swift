// 实例方法
class Counter {
    var count = 0;
    func increment() {
        count += 1;
    }
    
    func increment(_ amount: Int) {
        count += amount;
    }
    
    func reset() {
        count = 0;
    }
}

let counter_1 = Counter();
counter_1.increment();
print("counter_1.count", counter_1.count);
counter_1.increment(12);
print("counter_1.count", counter_1.count);
counter_1.reset();
print("counter_1.count", counter_1.count);

// self 属性
class Count_2 {
    var count = 0;
    func increment(_ count: Int = 2) {
        self.count += count;
    }
}

// 实例方法中修改值类型
// ! 结构体和枚举是值类型。默认情况下，值类型属性不能被自身的实例方法修改。
// 通过 mutating 可以修改 struct 和 enum 的 selft 的值
struct Point_1 {
    var x = 0.0;
    var y = 0.0;
    mutating func moveBy(_ x:Double, _ y: Double) {
        self.x += x;
        self.y += y;
    }
}

var pointer = Point_1();
pointer.moveBy(12, 12);
print("pointer", pointer);

// 重写整个 struct 或者 enum
struct Pointer_2 {
    var x = 0.0, y = 0.0;
    mutating func moveBy(_ x: Double, _ y: Double) {
        self = Pointer_2(x: self.x + x, y: self.y + y);
    }
    
//    init(_ x: Double, _ y: Double) {
//        self.x = x;
//        self.y = y;
//    }
}
var pointer_2 = Pointer_2();
pointer_2.moveBy(12, 12);
pointer_2.moveBy(12, 12);
print("pointer_2", pointer_2);

// 通过方法修改 enum 实例值
enum LightEnum: Int {
    case on = 1;
    case off = 0;
    mutating func toggle() {
        self = self == LightEnum.on ? LightEnum.off : LightEnum.on;
    }
}

var light = LightEnum.on;
print("light", light, light.rawValue);
light.toggle();
print("light", light, light.rawValue);

// 类型方法 - 静态方法
struct Light {
    static var defaultStatus: LightEnum = LightEnum.off;
    
    var status: LightEnum = defaultStatus;
    
    static func isOn(_ light: Light) -> Bool {
        return light.status == LightEnum.on;
    }
    
    mutating func reset() {
        self.status = Light.defaultStatus;
    }
}

var light_2 = Light();
light_2.status = LightEnum.on;
print("light.isOn", Light.isOn(light_2));
light_2.reset();
print("light.isOn", Light.isOn(light_2));
Light.defaultStatus = LightEnum.on;
light_2.reset();
print("light.isOn", Light.isOn(light_2));
