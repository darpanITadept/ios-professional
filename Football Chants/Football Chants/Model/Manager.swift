//
//  Manager.swift
//  Football Chants
//
//  Created by Darpan Choudhary on 26/08/23.
//

import Foundation

enum JobType {
    case manager
    case headCoach
}

struct Manager {
    let name: String
    let job: JobType
}
