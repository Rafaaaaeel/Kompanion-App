//
//  ContentView.swift
//  Kompanion-App
//
//  Created by Rafael Oliveira on 26/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            KTitle()
                .font(.h3)
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
