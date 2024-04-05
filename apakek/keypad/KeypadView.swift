//
//  KeypadView.swift
//  apakek
//
//  Created by Paramitha on 27/03/24.
//

import SwiftUI

struct KeypadView: View {
    
    @Binding var input: String
    
    @Binding var actualText: String
    
    @State var inputCache: String = "" {
        didSet {
            if inputCache.count > 0 {
                input = String.init(inputCache.last ?? Character(""))
            }
        }
    }

    let emptyIndexes: [KeyData.Press: Int] = [
        .one: 0,
        .two: 0,
        .three: 0,
        .four: 0,
        .five: 0,
        .six: 0,
        .seven: 0,
        .eight: 0,
        .nine: 0,
        .star: 0,
        .zero: 0,
        .hash: 0,
    ]
    
    // keep track of the current index for each button
    @State var currentIndexes: [KeyData.Press: Int] = [
        .one: 0,
        .two: 0,
        .three: 0,
        .four: 0,
        .five: 0,
        .six: 0,
        .seven: 0,
        .eight: 0,
        .nine: 0,
        .star: 0,
        .zero: 0,
        .hash: 0,
    ]
    
    @State var currentKey: KeyData.Press = .none
    
    func addText(_ key: KeyData.Press) {
        // if just switched key, reset the index first
        if currentKey != key {
            currentIndexes[key] = 0
        }
        
        // track which key is being pressed
        currentKey = key
        
        guard let char = KeyData.pressValue[key], let currentIndex = currentIndexes[key] else { return }
        
        let x = String(char[currentIndex])
        inputCache.append(x)
        
        // loop item on the char list
        currentIndexes[key] = (currentIndex + 1) % char.count
    }
    
    func nextLetter() {
        // append text to input
        actualText += input
        
        // reset cache
        inputCache = ""
        
        // reset indexes
        currentIndexes = emptyIndexes
    }
    
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Button(action: {
                        addText(.one)
                    }, label: {
                        KeypadButtonView(key: .one)
                    })
                    Button(action: {
                        addText(.two)
                    }, label: {
                        KeypadButtonView(key: .two)
                    })
                    Button(action: {
                        addText(.three)
                    }, label: {
                        KeypadButtonView(key: .three)
                    })
                }
                GridRow {
                    Button(action: {
                        addText(.four)
                    }, label: {
                        KeypadButtonView(key: .four)
                    })
                    Button(action: {
                        addText(.five)
                    }, label: {
                        KeypadButtonView(key: .five)
                    })
                    Button(action: {
                        addText(.six)
                    }, label: {
                        KeypadButtonView(key: .six)
                    })
                }
                GridRow {
                    Button(action: {
                        addText(.seven)
                    }, label: {
                        KeypadButtonView(key: .seven)
                    })
                    Button(action: {
                        addText(.eight)
                    }, label: {
                        KeypadButtonView(key: .eight)
                    })
                    Button(action: {
                        addText(.nine)
                    }, label: {
                        KeypadButtonView(key: .nine)
                    })
                }
                GridRow {
                    Button(action: {
                        addText(.star)
                    }, label: {
                        KeypadButtonView(key: .star)
                    })
                    Button(action: {
                        addText(.zero)
                    }, label: {
                        KeypadButtonView(key: .zero)
                    })
                    Button(action: {
                        addText(.hash)
                    }, label: {
                        KeypadButtonView(key: .hash)
                    })
                }
                
                Button {
                    nextLetter()
                } label: {
                    Text("Next character")
                }

            }
        }
    }
}
