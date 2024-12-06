//
//  day4.swift
//  AdventOfCode2024
//
//  Created by Mandy Man on 06/12/2024.
//

let xmas = Array("XMAS")
let samx = Array("SAMX")

func runDay4() throws {
    let fileName = "input.txt"
    let filePath = "/Users/mandyman/Projects/adventofcode2024/AdventOfCode2024/AdventOfCode2024/day4/\(fileName)"
    let fileContents = try String(contentsOfFile: filePath, encoding: .utf8)
    
    let lines = fileContents.split(separator: "\n").map { Array($0) }
    let foundWordsCount = countAllMatchingWords(lines: lines, xIndex: 0, yIndex: 0)
    print("Found words: ", foundWordsCount)
}

func countAllMatchingWords(lines: [[Substring.Element]], xIndex: Int, yIndex: Int) -> Int {
    if yIndex >= lines.count {
        return 0
    }
    let currentLine = lines[yIndex]
    if xIndex >= currentLine.count {
        return countAllMatchingWords(lines: lines, xIndex: 0, yIndex: yIndex + 1)
    }
    var foundWords = 0
    foundWords += countMatchesOfWordInLines(xmas, lines, xIndex, yIndex)
    foundWords += countMatchesOfWordInLines(samx, lines, xIndex, yIndex)
    return foundWords + countAllMatchingWords(lines: lines, xIndex: xIndex + 1, yIndex: yIndex)
}

func countMatchesOfWordInLines(_ word: [Substring.Element], _ lines: [[Substring.Element]], _ xIndex: Int, _ yIndex: Int) -> Int {
    var foundWords = 0
    if isMatchFromTheCurrentPlace(word: word, lines: lines, xIndex: xIndex, yIndex: yIndex, wordIndex: 0, directionX: 1, directionY: 0) {
        foundWords += 1
    }
    if isMatchFromTheCurrentPlace(word: word, lines: lines, xIndex: xIndex, yIndex: yIndex, wordIndex: 0, directionX: 1, directionY: 1) {
        foundWords += 1
    }
    if isMatchFromTheCurrentPlace(word: word, lines: lines, xIndex: xIndex, yIndex: yIndex, wordIndex: 0, directionX: 0, directionY: 1) {
        foundWords += 1
    }
    if isMatchFromTheCurrentPlace(word: word, lines: lines, xIndex: xIndex, yIndex: yIndex, wordIndex: 0, directionX: -1, directionY: 1) {
        foundWords += 1
    }
    return foundWords
}

func isMatchFromTheCurrentPlace(
    word: [Substring.Element],
    lines: [[Substring.Element]],
    xIndex: Int,
    yIndex: Int,
    wordIndex: Int,
    directionX: Int,
    directionY: Int
) -> Bool {
    if wordIndex >= word.count {
        return true
    }
    if yIndex >= lines.count {
        return false
    }
    let currentLine = lines[yIndex]
    if xIndex < 0 || xIndex >= currentLine.count {
        return false
    }
    if word[wordIndex] != currentLine[xIndex] {
        return false
    }
    return isMatchFromTheCurrentPlace(word: word, lines: lines, xIndex: xIndex + directionX, yIndex: yIndex + directionY, wordIndex: wordIndex + 1, directionX: directionX, directionY: directionY)
}
