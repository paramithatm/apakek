//
//  KeypadView.swift
//  apakek
//
//  Created by Paramitha on 27/03/24.
//

import SwiftUI

struct KeypadView: View {
    
//    @State var textPreview: String = ""
//    @State var textInputs: String = ""
    
//    @State var inputCache: [String] = [] {
//    }
    
    @State var input: String = ""
    

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
    
    func addText(_ key: KeyData.Press) {
        guard let char = KeyData.pressValue[key], let currentIndex = currentIndexes[key] else { return }
        let x = String(char[currentIndex])
        input.append(x)
        
        // loop item on the char list
        currentIndexes[key] = (currentIndex + 1) % char.count
    }
    
//    func nextLetter() {
//        if inputCache.count > 0 {
//            // confirm the last character inputted
//            textPreview += inputCache.last ?? ""
//            
//            // clear out input cache
//            inputCache = []
//            
//        }
//    }
    
    var body: some View {
        VStack {
            TextField(text: $input) {
                Text("Text Preview")
            }
            
//            TextField(text: $textInputs) {
//                Text("All inputs")
//            }
            
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
                    KeypadButtonView(key: .star)
                    KeypadButtonView(key: .zero)
                    KeypadButtonView(key: .hash)
                }
                Button {
                    
                } label: {
                    Text("Next character")
                }

            }
        }
    }
}
