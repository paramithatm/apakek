//
//  KeypadTestingView.swift
//  apakek
//
//  Created by Paramitha on 05/04/24.
//

import SwiftUI

struct KeypadTestingView: View {
    
    @State var input: String = ""
    
    @State var actualText: String = ""
    
    var body: some View {
        
        VStack {
            TextField.init(text: $input) {
                Text("Textfield")
            }
            
            TextField.init(text: $actualText) {
                Text("Textfield")
            }
            
            KeypadView(input: $input, actualText: $actualText)
        }
        
    }
}
