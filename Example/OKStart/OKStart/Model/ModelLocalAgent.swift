//
//  ModelLocalAgent.swift
//  OKStart
//
//  Created by mituser on 08/03/23.
//

import Foundation
import Scriptable


enum AgentState: String {
    case start
    case running
    case stop
}

enum LocalAgentCommand: String {
    case start = #"osascript -e 'tell application "Terminal"' -e 'activate' -e 'do script "bamboo-agent-home/bin/bamboo-agent.sh start"' -e 'end tell'"#
    case stop = #"osascript -e 'tell application "Terminal"' -e 'activate' -e 'do script "bamboo-agent-home/bin/bamboo-agent.sh stop"' -e 'end tell'"#
}

class LocalAgent: ObservableObject {
    @Published var currentState: AgentState = .start
    
    func start() {
        Task.Custom.command(LocalAgentCommand.start.rawValue).runTask()
        currentState = .running
    }
    
    func stop() {
        Task.Custom.command(LocalAgentCommand.stop.rawValue).runTask()
        currentState = AgentState.stop
    }
    
}
