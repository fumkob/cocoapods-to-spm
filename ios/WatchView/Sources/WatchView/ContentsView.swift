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
        NavigationView {
            ScrollView {
                VStack(spacing: 8) {
                    Text("Hello, Packages!")
                        .font(.title2)
                        .lineLimit(1)
                        .minimumScaleFactor(0.5)
                    Button {
                        usecase.dispatch(.read)
                    } label: {
                        Text("Read")
                    }
                    .padding(.horizontal, 16)

                    if let userId = usecase.state.userId,
                       let count = usecase.state.count {
                        Text("UserID: \(userId)")
                        Text("Counter: \(count)")
                    }
                    Button {
                        usecase.dispatch(.save(userId: "Onigiri"))
                    } label: {
                        Text("Count up")
                    }
                    .padding(.horizontal, 16)
                    
                    NavigationLink(destination: {
                        SecondView()
                    }, label: {
                        Text("Navigation Test")
                    })
                    .padding(.horizontal, 16)
                }
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
