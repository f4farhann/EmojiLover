//
//  ContentView.swift
//  EmojiLover
//
//  Created by farhan haider on 19/08/24.
//

import SwiftUI

enum Emoji: String, CaseIterable {
    case 😀, 😇, 🥰, 😩, 😭
}
struct ContentView: View {
    
    @State var selection: Emoji = .😀
        @State private var scale: CGFloat = 1.0

    
    var body: some View {
        NavigationView{
            VStack {
                Text(selection.rawValue)
                    .font(.system(size: 150))
                    .scaleEffect(scale)
                    .animation(.easeInOut(duration: 0.5), value: scale)
                    .onChange(of: selection) {
                        withAnimation {
                            scale = 1.2
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                                scale = 1.0
                            }
                        }
                    }
                
                Picker("Select Emoji", selection: $selection){
                    ForEach(Emoji.allCases, id: \.self){ Emoji in
                        Text(Emoji.rawValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .navigationTitle("Emoji Lovers!")
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
