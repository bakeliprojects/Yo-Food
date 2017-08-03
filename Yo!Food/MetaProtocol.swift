//
//  MetaProtocol.swift
//  Yo!Food
//
//  Created by Yamadou Traore on 8/2/17.
//  Copyright © 2017 com.example. All rights reserved.
//

import Foundation

// All Realm object models have to follow the Meta protocol to provide the URL
protocol Meta {
    static func url()->String
}
