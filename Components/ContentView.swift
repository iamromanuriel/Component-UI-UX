//
//  ContentView.swift
//  Components
//
//  Created by Roman Uriel on 16/05/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            BarDarkMode(colorScheme: .dark, isDarkModeActive: false)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
