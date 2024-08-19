//
//  ContentView.swift
//  EmojiLover
//
//  Created by farhan haider on 19/08/24.
//

import SwiftUI

enum Emoji: String, CaseIterable {
    case 😀, 😇, 🥰, 😩
}
struct ContentView: View {
    
    @State var selection: Emoji = .😀
    var body: some View {
        NavigationView{
            VStack {
                Text(selection.rawValue)
                    .font(.system(size: 150))
                
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
