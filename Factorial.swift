import Foundation
//  Created by Alexander Matheson
//  Created on 2023-Apr-17
//  Version 1.0
//  Copyright (c) 2023 Alexander Matheson. All rights reserved.
//
//  This program finds the factorial of each number in a file.

// Enum for error checking
enum InputError: Error {
  case InvalidInput
}

// Input in separate function for error checking
func convert(strUnconverted: String) throws -> Double {
  guard let numConverted = Double(strUnconverted.trimmingCharacters(in: CharacterSet.newlines)) else {
    throw InputError.InvalidInput
  }
  return numConverted
}

// This function finds the max run for each line.
func factorial(number: Double) -> Double {
  if number <= 1 {
    return number
  } else {
    return factorial(number: number - 1) * number
  }
}

// Read in lines from input.txt.
let inputFile = URL(fileURLWithPath: "input.txt")
let inputData = try String(contentsOf: inputFile)
let lineArray = inputData.components(separatedBy: .newlines)

// Open the output file for writing.
let outputFile = URL(fileURLWithPath: "output.txt")

// Call function to find run and print to output file.
var factorialString = ""
for position in lineArray {
  let unFactored = try convert(strUnconverted: position)
  let factored = factorial(number: unFactored)
  print(factored)

  // Write results to output 
  factorialString = factorialString + "\(factored)\n"
  try factorialString.write(to: outputFile, atomically: true, encoding: .utf8)
}
