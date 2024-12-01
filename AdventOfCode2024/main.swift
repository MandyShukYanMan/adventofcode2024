//
//  main.swift
//  AdventOfCode2024
//
//  Created by Mandy Man on 01/12/2024.
//

import Foundation

let fileName = "input.txt"
let filePath = "/Users/mandyman/Projects/adventofcode2024/AdventOfCode2024/AdventOfCode2024/\(fileName)"
let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)

let lines = fileContents.split(separator: "\n")
//print(lines)

var list1: [Int] = []
var list2: [Int] = []
for line in lines {
    let numbers = line.split(separator: " ")
    let firstNumber = Int(numbers[0])!
    let secondNumber = Int(numbers[1])!
    list1.append(firstNumber)
    list2.append(secondNumber)
}
//print("List 1:", list1)
//print("List 2:", list2)
list1.sort()
list2.sort()

var result = 0
for (number1, number2) in zip(list1, list2) {
    result += abs(number2 - number1)
}
print(result)

var result2 = 0
for number in list1 {
    let count = list2.filter { $0 == number }.count
    result2 += number * count
}
print(result2)
