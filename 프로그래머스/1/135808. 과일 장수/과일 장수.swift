import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    let sorted = score.sorted(){$0 > $1}
    var result = 0
    
    for i in 0..<sorted.count{
        if (i + 1) % m == 0 && i != 0{
            result += m * sorted[i]
        }
    }
    return result
}