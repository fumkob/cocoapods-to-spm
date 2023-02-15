//
//  DashboardUseCase.swift
//  
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import Foundation
import UseCaseKit
import Swinject

public struct Dashboard: Equatable {
    public var userId: String?
}

public enum DashboardCommand: Command {
    public typealias State = Dashboard

    case read
    case save(userId: String)
}

public typealias DashboardObject = ObservableUseCase<DashboardCommand>
public typealias DashboardUseCase = UseCase<DashboardCommand>

public extension DashboardUseCase {
    static func make(resolver: Resolver) -> DashboardUseCase {
        return .init(.init()) { store in

            let localStorage = resolver.resolve(LocalStorage.self)
            return .onReceive {
                switch $0 {
                case .read: store.update { $0.userId = localStorage?.userId }
                case let .save(userId): localStorage?.userId = userId
                }
            }
        }
    }
}
