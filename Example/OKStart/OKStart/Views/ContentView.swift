//
//  ContentView.swift
//  OKStart
//
//  Created by mituser on 01/03/23.
//

import SwiftUI
import Scriptable

struct ContentView: View {
    @State var agentCurrentState = AgentState.start
    
    var body: some View {
        Color.init(.white)
            .edgesIgnoringSafeArea(.all)
            .overlay(
                ZStack {
                    VStack(spacing: 8) {
                        Spacer()
                        
                        Text("Bamboo Agent")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                        
                        Spacer().frame(height: 30)
                        
                        // Start Button
                        Button(agentCurrentState == .running ? agentCurrentState.rawValue : AgentState.start.rawValue) {
                            self.startAgent()
                        }
                        .buttonStyle(ColoredButtonStyle(backgroundColor: .purple))
                       
                        Spacer().frame(height: 10)
                        
                        // STOP Button
                        Button("stop") {
                            self.stopAgent()
                        }
                        .buttonStyle(ColoredButtonStyle(backgroundColor: .orange))
                        
                        Spacer()
                        
                    }
                } // zstack
            )
            .edgesIgnoringSafeArea(.bottom)
            .onAppear { self.startAgent() }
    }
    
    func startAgent() {
        Task.Custom.command(LocalAgentCommand.start.rawValue).runTask()
        agentCurrentState = AgentState.running
    }
    
    func stopAgent() {
        Task.Custom.command(LocalAgentCommand.stop.rawValue).runTask()
        agentCurrentState = AgentState.stop
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
