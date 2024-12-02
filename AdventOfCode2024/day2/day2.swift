//
//  day2.swift
//  AdventOfCode2024
//
//  Created by Mandy Man on 02/12/2024.
//


fileprivate func isSafeAscending(_ numbers: [Int]) -> Bool {
    for i in 0..<numbers.count - 1 {
        let leftNumber = numbers[i]
        let rightNumber = numbers[i + 1]
        if leftNumber >= rightNumber {
            return false
        }
        if rightNumber - leftNumber < 1 || rightNumber - leftNumber > 3 {
            return false
        }
    }
    return true
}

fileprivate func isSafeDescending(_ numbers: [Int]) -> Bool {
    for i in 0..<numbers.count - 1 {
        let leftNumber = numbers[i]
        let rightNumber = numbers[i + 1]
        if leftNumber <= rightNumber {
            return false
        }
        if leftNumber - rightNumber < 1 || leftNumber - rightNumber > 3 {
            return false
        }
    }
    return true
}

func runDay2() throws {
    let fileName = "input.txt"
    let filePath = "/Users/mandyman/Projects/adventofcode2024/AdventOfCode2024/AdventOfCode2024/day2/\(fileName)"
    let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
    
    let lines = fileContents.split(separator: "\n")
    var safeReport = 0
    var safeReportAfterChange = 0
    
    for line in lines {
        let numbers = line.split(separator: " ").map {Int($0)!}
        
        if isSafeAscending(numbers) || isSafeDescending(numbers) {
            safeReport += 1
            continue
        }
        for i in 0..<numbers.count {
            var filteredNumbers: [Int] = []
            for (index, number) in numbers.enumerated() {
                if index != i {
                    filteredNumbers.append(number)
                }
            }
            if isSafeAscending(filteredNumbers) || isSafeDescending(filteredNumbers) {
                safeReportAfterChange += 1
                break
            }
        }
    }
    print(safeReport)
    print(safeReport + safeReportAfterChange)
}
