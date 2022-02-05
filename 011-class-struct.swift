// 定义类和结构体
class SomeClass {
    
}

struct SomeStruct {
    
}

struct Resolution {
    var width = 0;
    var height = 0;
}

print("Resolution", Resolution());

class VideoMode  {
    var resolution = Resolution();
    var frameRate = 0.0;
    var name: String?;
}

print("VideoMode", VideoMode());

let videoMode = VideoMode();

print(videoMode.resolution.width);
videoMode.resolution.width = 100;
print(videoMode.resolution);

// 初始化
let resolution = Resolution(width: 1090, height: 100);
print(resolution);
let resolution_2 = resolution;
//print(resolution == resolution_2); // Error

// 类是引用类型
let video_1 = VideoMode();
let video_2 = video_1;
video_1.frameRate = 0.32;
print(video_1.frameRate, video_2.frameRate);
print(video_1 === video_2);

// 特征运算符 class 
print(video_1 === video_2);
print(video_1 !== video_2);










