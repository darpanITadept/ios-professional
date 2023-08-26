//
//  Team.swift
//  Football Chants
//
//  Created by Darpan Choudhary on 26/08/23.
//

import Foundation

struct Team {
    let id: TeamType
    let name: String
    let info: String
    let manager: Manager
    let founded: String
    var isPlaying: Bool = false
}
