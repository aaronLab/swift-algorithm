import Foundation

func solution(_ operations:[String]) -> [Int] {
    
    // 고작 이 정도가 3단계?
    
    var temp = [Int]()
    
    for operation in operations {
        
        if operation.contains("I") {
            let values = operation.split(separator: " ")
            guard let value = Int(values[1]) else { continue }
            temp.append(value)
        } else {
            let cache = temp.sorted()
            switch operation {
            case Operation.deleteMax.rawValue:
                temp = temp.filter { $0 != cache.max() }
            case Operation.deleteMinimum.rawValue:
                temp = temp.filter { $0 != cache.min() }
            default:
                break
            }
        }
        
    }
    
    return [temp.max() ?? 0, temp.min() ?? 0]
}

enum Operation: String {
    case deleteMax = "D 1"
    case deleteMinimum = "D -1"
}

print(solution(["I 16", "D 1"])) // ---> [0, 0]
print(solution(["I 7", "I 5", "I -5", "D -1"])) // ---> [7, 5]
print(solution(["I -45", "I 653", "D 1", "I -642", "I 45", "I 97", "D 1", "D -1", "I 333"])) // ---> [333, -45]
