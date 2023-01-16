//
//  DividerView.swift
//  Moonshot
//
//  Created by Edwin Przeźwiecki Jr. on 15/01/2023.
//

/// Challenge 2:

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.lightBackground)
            .padding(.vertical)
    }
}

struct DividerView_Previews: PreviewProvider {
    static var previews: some View {
        DividerView()
    }
}
