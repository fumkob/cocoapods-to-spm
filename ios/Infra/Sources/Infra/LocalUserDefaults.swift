//
//  File.swift
//  
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import Foundation
import UseCase

public class LocalUserDefaults: LocalStorage {

    private let userDefaults: UserDefaults

    public var userId: String? {
        get { userDefaults.string(forKey: "userId") }
        set(value) { userDefaults.set(value, forKey: "userId") }
    }

    public var count: Int? {
        get { userDefaults.integer(forKey: "count") }
        set(value) { userDefaults.set(value, forKey: "count") }
    }

    public init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
}
