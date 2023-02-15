//
//  ViewInjector.swift
//  
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import Foundation
import Swinject
import SwiftUI

/// Injectable な View に渡される Context
struct BuildContext<Input> {
    let resolver: Resolver
    fileprivate(set) var input: Input!
}

/// resolver 経由で生成できるインスタンスのプロトコル
protocol Injectable {
    associatedtype Input = Never

    init(_ context: BuildContext<Input>)
}

/// 内部で resolver を使ってインスタンスを生成できるオブジェクトのプロトコル
protocol Injector {
    var resolver: Resolver! { get set }
}

extension Injectable where Input == Never {

    init(_ resolver: Resolver) {
        self.init(.init(resolver: resolver))
    }

}

struct BuildHelper<Target> {
    private let resolver: Resolver

    fileprivate init(_ resolver: Resolver) {
        self.resolver = resolver
    }
}

extension BuildHelper where Target: Injectable {

    func with(_ argument: Target.Input) -> Target {
        Target(.init(resolver: resolver, input: argument))
    }

}

extension BuildHelper where Target: Injectable & Injector {

    func with(_ argument: Target.Input) -> Target {
        var service = Target(.init(resolver: resolver, input: argument))
        service.resolver = resolver
        return service
    }

}

extension Resolver {

    /// 指定の型のオブジェクトを resolver を使って「新しく」生成する
    /// - Returns: type で指定された型のインスタンス
    func build<S: Injectable & Injector>(_ type: S.Type) -> S where S.Input == Never {
        var service = type.init(self)
        service.resolver = self
        return service
    }

    /// 指定の型のオブジェクトを resolver を使って「新しく」生成する
    /// - Returns: type で指定された型のインスタンス
    func build<S: Injectable>(_ type: S.Type) -> S where S.Input == Never {
        type.init(self)
    }

    func build<S: Injectable>(_ type: S.Type) -> BuildHelper<S> {
        BuildHelper<S>(self)
    }

}
