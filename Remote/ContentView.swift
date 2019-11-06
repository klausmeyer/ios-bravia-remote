//
//  ContentView.swift
//  Remote
//
//  Created by Klaus Meyer on 05.11.19.
//  Copyright © 2019 Klaus Meyer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var remote = Remote()
    @State var showingAlert = false
    
    var body: some View {
        let padding: CGFloat = 30
       
        return VStack {
            HStack {
                Button(action: { self.perform(cmd: .power) }) {
                    Image(systemName: "power")
                        .font(.largeTitle).padding(padding).foregroundColor(.red)
                }
                Button(action: { self.perform(cmd: .input) }) {
                    Image(systemName: "link")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .ok) }) {
                    Image(systemName: "checkmark")
                        .font(.largeTitle).padding(padding).foregroundColor(.green)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .vol_down) }) {
                    Image(systemName: "speaker.1")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .mute) }) {
                    Image(systemName: "speaker.slash")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .vol_up) }) {
                    Image(systemName: "speaker.3")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .num_1) }) {
                    Text("1")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_2) }) {
                    Text("2")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_3) }) {
                    Text("3")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .num_4) }) {
                    Text("4")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_5) }) {
                    Text("5")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_6) }) {
                    Text("6")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .num_7) }) {
                    Text("7")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_8) }) {
                    Text("8")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_9) }) {
                    Text("9")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .channel_down) }) {
                    Image(systemName: "minus")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_0) }) {
                    Text("0")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .channel_up) }) {
                    Image(systemName: "plus")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Oh snap!"), message: Text("Something went wrong"), dismissButton: .default(Text("Got it!")))
        }
    }
    
    func perform(cmd: RemoteCommand) {
        self.remote.perform(cmd: cmd) { success in
            self.showingAlert = !success
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
