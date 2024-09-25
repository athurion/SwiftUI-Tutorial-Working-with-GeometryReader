//
//  ContentView.swift
//  SwiftUI Tutorial: Working with GeometryReader
//
//  Created by Alvin Sosangyo on 9/17/24.
//


import SwiftUI

struct ContentView: View {
    
    @State private var currentView: CurrentView = .blue
    
    var body: some View {
        GeometryReader { geo in
            HStack(spacing: 0) {
                coloredView(color: .blue) {
                    currentView = .purple
                }
                .frame(width: geo.size.width, height: geo.size.height)
                
                coloredView(color: .purple) {
                    currentView = .blue
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
            .offset(x: currentView == .blue ? 0 : -geo.size.width)
        }
        .animation(.default, value: currentView)
    }
    
    @ViewBuilder
    private func coloredView(color: Color, action: @escaping () -> Void) -> some View {
        ZStack {
            color
            
            Button(action: action) {
                Text("Tap to Switch View")
                    .font(.body)
                    .foregroundColor(.white)
            }
        }
    }
    
}

extension ContentView {
    
    enum CurrentView {
        case blue
        case purple
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
