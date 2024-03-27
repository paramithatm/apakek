//
//  KeypadButtonView.swift
//  apakek
//
//  Created by Paramitha on 27/03/24.
//

import SwiftUI

struct KeypadButtonView: View {
    
    @State var key: KeyData.Press
    
    var body: some View {
        Text(key.rawValue)
            .foregroundStyle(.blue)
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .background(.black)
            .clipShape(.rect(cornerRadii: RectangleCornerRadii(topLeading: 4, bottomLeading: 4, bottomTrailing: 4, topTrailing: 4)))
    }
}
