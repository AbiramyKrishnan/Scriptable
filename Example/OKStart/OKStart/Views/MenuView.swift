//
//  MenuView.swift
//  OKStart
//
//  Created by mituser on 08/03/23.
//

import SwiftUI
import Scriptable

struct MenuView: View {
    @ObservedObject var localAgentModel: LocalAgent = LocalAgent()
    
    var body: some View {
        
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
}
