func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var walls = Array(repeating: false, count: n + 1)
    var ans = 0

    for s in section {
        walls[s] = true
    }

    for i in 1...n {
        if walls[i] {
            for j in i..<(i + m) {
                guard j <= n else { break }
                walls[j] = false
            }
            ans += 1
        }
    }

    return ans
}