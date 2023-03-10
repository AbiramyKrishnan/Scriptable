//
//  OKStartApp.swift
//  OKStart
//
//  Created by mituser on 01/03/23.
//

import SwiftUI


@main
struct OKStartApp: App {
    @ObservedObject var localAgentModel: LocalAgent = LocalAgent()
    
    var body: some Scene {
        
        MenuBarExtra("BambooAgent", systemImage: localAgentModel.currentState == .running ? "circle.hexagonpath.fill" : "circle.hexagonpath") {
            Text("Bamboo Agent")
                .foregroundColor(.black)
                .font(.caption2)
            
            // Start Button
            Button(localAgentModel.currentState == .running ? localAgentModel.currentState.rawValue : AgentState.start.rawValue) {
                localAgentModel.start()
            }
            
            // STOP Button
            Button("stop") {
                localAgentModel.stop()
            }
            
            Divider()
            
            Button("Exit") {
                NSApplication.shared.terminate(nil)
            }
        }
        
        WindowGroup {
        }
    }
}
