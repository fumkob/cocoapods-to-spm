//
//  File.swift
//  
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import Foundation
import UseCaseKit

public struct Dashboard: Equatable {

}

public enum DashboardCommand: Command {
    public typealias State = Dashboard

}

public typealias DashboardUseCase = UseCase<DashboardCommand>
