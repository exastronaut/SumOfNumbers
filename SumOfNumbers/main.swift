import Foundation

let textFile = "input.txt"

if let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
    do {
        let fileURL = directory.appendingPathComponent(textFile)
        let text = try String(contentsOf: fileURL, encoding: .utf8)
        var textArray = [String]()
        textArray = text.components(separatedBy: " ")
        let numberArray = textArray.compactMap { Int($0) }.reduce(0, +)
        let fileOutput = directory.appendingPathComponent("result.txt")
        try String(numberArray).write(to: fileOutput, atomically: false, encoding: .utf8)
    }
    catch {
        print("error")
    }
}
