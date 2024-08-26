import Foundation

func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
    var wantdic = [String: Int]()
    var discntdic = [String: Int]()
    
    for idx in 0..<want.count{
        let name = want[idx]
        let cnt = number[idx]
        wantdic.updateValue(cnt, forKey: name)
    }
    
    for idx in 0...9{
        let dis = discount[idx]
        discntdic[dis] = (discntdic[dis] ?? 0) + 1
    }
    
    func joinable(_ a: [String: Int], _ b: [String: Int]) -> Bool{
        for item in a{
            let name = item.key
            let cnt = item.value
            
            if (b[name] ?? 0) < cnt{
                return false
            }
        }
        return true
    }
    
    var count = 0
    
    for day in 0..<discount.count - 9{
        if day != 0{
            var removeitem = discount[day-1]
            var additem = discount[day+9]
            
            discntdic[removeitem] = (discntdic[removeitem] ?? 0) - 1
            discntdic[additem] = (discntdic[additem] ?? 0) + 1
        }
        count = joinable(wantdic, discntdic) ? count + 1 : count
    }
    
    return count
}