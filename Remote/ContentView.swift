//
//  ContentView.swift
//  Remote
//
//  Created by Klaus Meyer on 05.11.19.
//  Copyright © 2019 Klaus Meyer. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var showingAlert = false
    
    struct RemoteButton: View {
        let image: String;
        let color: Color;
        let command: RemoteCommand;

        var body: some View {
            Button(action: {
                Client.perform(cmd: self.command) { success in
                    // ...
                }
            }) {
                Image(systemName: image)
                    .font(.largeTitle)
                    .padding(40)
                    .foregroundColor(color)
            }
        }
    }

    var body: some View {
        return VStack {
            HStack {
                RemoteButton(image: "power", color: .red, command: .power)
                RemoteButton(image: "link", color: .blue, command: .input)
                RemoteButton(image: "checkmark", color: .green, command: .ok)
            }
            HStack {
                RemoteButton(image: "speaker.1.fill", color: .blue, command: .vol_down)
                RemoteButton(image: "speaker.slash.fill", color: .blue, command: .mute)
                RemoteButton(image: "speaker.3.fill", color: .blue, command: .vol_up)
            }
            HStack {
                RemoteButton(image: "1.circle.fill", color: .blue, command: .num_1)
                RemoteButton(image: "2.circle.fill", color: .blue, command: .num_2)
                RemoteButton(image: "3.circle.fill", color: .blue, command: .num_3)
            }
            HStack {
                RemoteButton(image: "4.circle.fill", color: .blue, command: .num_4)
                RemoteButton(image: "5.circle.fill", color: .blue, command: .num_5)
                RemoteButton(image: "6.circle.fill", color: .blue, command: .num_6)
            }
            HStack {
                RemoteButton(image: "7.circle.fill", color: .blue, command: .num_7)
                RemoteButton(image: "8.circle.fill", color: .blue, command: .num_8)
                RemoteButton(image: "9.circle.fill", color: .blue, command: .num_9)
            }
            HStack {
                RemoteButton(image: "chevron.down.square.fill", color: .blue, command: .channel_down)
                RemoteButton(image: "0.circle.fill", color: .blue, command: .num_0)
                RemoteButton(image: "chevron.up.square.fill", color: .blue, command: .channel_up)
            }
        }.alert(isPresented: $showingAlert) {
            Alert(title: Text("Oh snap!"), message: Text("Something went wrong"), dismissButton: .default(Text("Got it!")))
        }
    }
    
    func perform(cmd: RemoteCommand) {
        Client.perform(cmd: cmd) { success in
            self.showingAlert = !success
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
