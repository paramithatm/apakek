//
//  KeypadView.swift
//  apakek
//
//  Created by Paramitha on 27/03/24.
//

import SwiftUI

struct KeypadView: View {
    
    @State var input: String = ""// []

    // Dictionary to keep track of the current index for each button
    @State var currentIndexes: [KeyData.Press: Int] = [
        .one: 0, .two: 0
    ]
    
    init() {
        for key in KeyData.Press.allCases {
            currentIndexes[key] = 0
        }
    }
    
    func addText(_ key: KeyData.Press) {
        guard let char = KeyData.pressValue[key], let currentIndex = currentIndexes[key] else { return }
        let x = String(char[currentIndex])
        input.append(x)
        
        currentIndexes[key] = (currentIndex + 1) % char.count
        
    }
    
    var body: some View {
        VStack {
            TextField("name", text: $input)
            
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
//                        input.append(.three)
                    }, label: {
                        KeypadButtonView(key: .three)
                    })
                }
                GridRow {
                    Button(action: {
//                        input.append(.four)
                    }, label: {
                        KeypadButtonView(key: .four)
                    })
                    Button(action: {
//                        input.append(.five)
                    }, label: {
                        KeypadButtonView(key: .five)
                    })
                    Button(action: {
//                        input.append(.six)
                    }, label: {
                        KeypadButtonView(key: .six)
                    })
                }
                GridRow {
                    Button(action: {
//                        input.append(.seven)
                    }, label: {
                        KeypadButtonView(key: .seven)
                    })
                    Button(action: {
//                        input.append(.eight)
                    }, label: {
                        KeypadButtonView(key: .eight)
                    })
                    Button(action: {
//                        input.append(.nine)
                    }, label: {
                        KeypadButtonView(key: .nine)
                    })
                }
                GridRow {
                    KeypadButtonView(key: .star)
                    KeypadButtonView(key: .zero)
                    KeypadButtonView(key: .hash)
                }
            }
        }
    }
}
