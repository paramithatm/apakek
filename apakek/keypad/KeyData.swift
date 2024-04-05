//
//  KeyData.swift
//  apakek
//
//  Created by Paramitha on 27/03/24.
//

import Foundation

struct KeyData {
    
    // list options of key that user can press
    enum Press: String, CaseIterable {
        case one = "1"
        case two = "2"
        case three = "3"
        case four = "4"
        case five = "5"
        case six = "6"
        case seven = "7"
        case eight = "8"
        case nine = "9"
        case star = "*"
        case zero = "0"
        case hash = "#"
    }
    
    // ordered list of possible text from key press
    static var pressValue: [KeyData.Press: [Character]] = [
        .one: [".", ",", "'", "?", "!", "1", "\"", "-", "(", ")", "@", "/", ":", "_", ";"],
        .two: ["a", "b", "c", "2"],
        .three: ["d","e", "f", "3"],
        .four: ["g" , "h", "i", "4"],
        .five: ["j", "k", "l", "5"],
        .six: ["m", "n", "o", "6"],
        .seven: ["p", "q", "r", "s", "7"],
        .eight: ["t", "u", "v"],
        .nine: ["w", "x", "y", "z"],
        .star: [],
        .zero: [" "],
        .hash: []
    ]
    
}
