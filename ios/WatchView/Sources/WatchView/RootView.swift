//
//  RootView.swift
//  
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import SwiftUI
import Swinject
import UseCase

public struct RootView: View {

    let resolver: Resolver

    public var body: some View {
        resolver.build(ContentsView.self).with(())
    }

    public init(resolver: Resolver) {
        self.resolver = resolver
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {

        let container = Container()
        RootView(resolver: container)
    }
}
