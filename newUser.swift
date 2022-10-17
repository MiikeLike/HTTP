//
//  newUser.swift
//  HTTP
//
//  Created by Mikel Valle on 17/10/22.
//

import Foundation


struct NewUser: Encodable {
    let name: String
    let email: String
    let gender: String
    let status: String
}
