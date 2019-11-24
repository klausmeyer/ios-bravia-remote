//
//  ContentView.swift
//  Remote
//
//  Created by Klaus Meyer on 05.11.19.
//  Copyright © 2019 Klaus Meyer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var client = Client()
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
                    Image(systemName: "speaker.1.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .mute) }) {
                    Image(systemName: "speaker.slash.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .vol_up) }) {
                    Image(systemName: "speaker.3.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .num_1) }) {
                    Image(systemName: "1.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_2) }) {
                    Image(systemName: "2.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_3) }) {
                    Image(systemName: "3.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .num_4) }) {
                    Image(systemName: "4.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_5) }) {
                    Image(systemName: "5.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_6) }) {
                    Image(systemName: "6.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .num_7) }) {
                    Image(systemName: "7.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_8) }) {
                    Image(systemName: "8.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_9) }) {
                    Image(systemName: "9.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
            HStack {
                Button(action: { self.perform(cmd: .channel_down) }) {
                    Image(systemName: "chevron.down.square.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .num_0) }) {
                    Image(systemName: "0.circle.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
                Button(action: { self.perform(cmd: .channel_up) }) {
                    Image(systemName: "chevron.up.square.fill")
                        .font(.largeTitle).padding(padding).foregroundColor(.accentColor)
                }
            }
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Oh snap!"), message: Text("Something went wrong"), dismissButton: .default(Text("Got it!")))
        }
    }
    
    func perform(cmd: RemoteCommand) {
        self.client.perform(cmd: cmd) { success in
            self.showingAlert = !success
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
