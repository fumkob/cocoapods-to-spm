//
//  RootView.swift
//  
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import SwiftUI
import UseCase

public struct RootView: View {

    var usecase: DashboardUseCase.ObservableObject!

    public var body: some View {
        VStack(spacing: 16) {
            Text("Hello, Packages!")
                .font(.title2)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Button {
                print("tapped!")
            } label: {
                Text("Tap me")
            }
            .padding(.horizontal, 16)

        }
    }

    public init() {}
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
