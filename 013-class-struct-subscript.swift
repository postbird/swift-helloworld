// subscript 定义下标
struct TimesTable {
    let multipier: Int;
    subscript(index: Int) -> Int {
        return multipier * index
    }
}

let timesTable = TimesTable(multipier: 10);

print("timesTable[1]", timesTable[1]);
print("timesTable[2]", timesTable[2]);

// 下标选项
// 一维数组实现一个 Matrix 二维矩阵
/**
 rows = 3, colums = 3;
 [1, 2, 3, 4, 5, 6]
 [
 1, 2, 3, 
 4, 5, 6,
 7, 8, 9,
 ]
 datas[2, 3] = datas[5] // 5 = (2 * (3 - 1) + 2) - 1
 */
struct Matrix {
    var rows: Int = 0, columns: Int = 0;
    var datas: [Double];
    
    func getIndex(_ row: Int, _ col: Int) -> Int {
        let index = row * (col - 1) + row - 1;
        assert(index < 0 || index > rows * columns, "Index out of range");
        return index;
    }
    
    init(rows: Int, columns: Int){
        self.rows = rows;
        self.columns = columns;
        datas = Array(repeating: 0.0, count: rows * columns);
    }
    
    subscript(_ row: Int, _ col: Int) -> Double{
        get {
            return datas[getIndex(row, col)];
        }
        set {
            datas[getIndex(row, col)] = newValue;
        }
    }
}

var matrix = Matrix(rows: 3, columns: 3);
print("matrix.datas", matrix.datas);
matrix[2, 3] = 2.3;
print("matrix[2, 3]", matrix[2, 3]);
print("matrix.datas", matrix.datas);
print("matrix[5, 3]", matrix[5, 3]);

// 静态下标
//static subscript
