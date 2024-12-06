//
//  day3.swift
//  AdventOfCode2024
//
//  Created by Mandy Man on 04/12/2024.
//
import Foundation

func runDay3() throws {
    let fileName = "input.txt"
    let filePath = "/Users/mandyman/Projects/adventofcode2024/AdventOfCode2024/AdventOfCode2024/day3/\(fileName)"
    let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
    
    let pattern = #"mul\((\d{1,3}),(\d{1,3})\)"#
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: [])
        
        let matches = regex.matches(in: fileContents, options: [], range: NSRange(fileContents.startIndex..., in: fileContents))
        
        var finalResult = 0
        
        for match in matches {
            if let leftNumberRange = Range(match.range(at: 1), in: fileContents),
               let rightNumberRange = Range(match.range(at: 2), in: fileContents) {
                
                let leftNumber = fileContents[leftNumberRange]
                let rightNumber = fileContents[rightNumberRange]
                
                let result = Int(leftNumber)! * Int(rightNumber)!
                finalResult += result
            }
        }
        print(finalResult)
    }
    
    
}

func runDay3Part2() throws {
    let fileName = "input.txt"
    let filePath = "/Users/mandyman/Projects/adventofcode2024/AdventOfCode2024/AdventOfCode2024/day3/\(fileName)"
    let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
    
    let pattern = #"(?:mul\((\d{1,3}),(\d{1,3})\))|(?:don't\(\))|(?:do\(\))"#
    
    do {
        let regex = try NSRegularExpression(pattern: pattern, options: [])
        
        let matches = regex.matches(in: fileContents, options: [], range: NSRange(fileContents.startIndex..., in: fileContents))
        
        var finalResult = 0
        var enableMul = true
        
        for match in matches {
            if let fullMatchRange = Range(match.range(at: 0), in: fileContents) {
                let fullMatch = fileContents[fullMatchRange] // mul(5,2) or don`t() or do()
                
                if fullMatch == "do()" {
                    enableMul = true
                }
                else if fullMatch == "don't()" {
                    enableMul = false
                }
                else if enableMul == true {
                    if let leftNumberRange = Range(match.range(at: 1), in: fileContents),
                       let rightNumberRange = Range(match.range(at: 2), in: fileContents) {
                        
                        let leftNumber = fileContents[leftNumberRange]
                        let rightNumber = fileContents[rightNumberRange]
                        
                        let result = Int(leftNumber)! * Int(rightNumber)!
                        finalResult += result
                    }
                }
                
                
            }
        }
        print(finalResult)
    }
    
    
}
