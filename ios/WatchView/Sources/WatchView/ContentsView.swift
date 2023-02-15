//
//  ContentsView.swift
//  
//
//  Created by Fumiaki Kobayashi on 2023/02/15.
//

import SwiftUI
import Swinject
import UseCase

public struct ContentsView: View {
    @ObservedObject var usecase: DashboardObject

    public var body: some View {
        VStack(spacing: 16) {
            Text("Hello, Packages!")
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Button {
                usecase.dispatch(.save(userId: "Onigiri"))
            } label: {
                Text("Tap me")
            }
            .padding(.horizontal, 16)

            if let userId = usecase.state.userId {
                Text("UserID: \(userId)")
            }
        }
    }


    public init(usecase: DashboardObject) {
        self.usecase = usecase
    }
}

extension ContentsView: Injectable {

    typealias Input = ()

    init(_ context: BuildContext<()>) {
        self.init(usecase: DashboardUseCase.make(resolver: context.resolver).asObservableObject())
    }
}

struct ContentsView_Previews: PreviewProvider {
    static var previews: some View {
        let container = Container()
        container.build(ContentsView.self).with(())
    }
}
