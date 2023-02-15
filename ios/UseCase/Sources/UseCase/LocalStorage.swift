//
//  LocalStorage.swift
//  
//
//  Created by Fumiaki Kobayashi on 2023/02/10.
//

import Foundation

public protocol LocalStorage: AnyObject {
    var userId: String? { get  set }
}
