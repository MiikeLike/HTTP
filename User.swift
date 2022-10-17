//
//  User.swift
//  HTTP
//
//  Created by Mikel Valle on 4/10/22.
//

import Foundation


//{
//   "code":200,
//   "meta":null,
//   "data":{
//       "id":123,
//       "name": "Aatreya Agarwal",
//       "email":"agarwal_aatreya@simonis-aufderhar.name",
//       "gender": "Male",
//       "status": "Inactive",
//       "created_at":"2020-10-10T03:50:06.151+05:30",
//       "update_at":"2020-10-10T03:50:06.151+05:30",
//    }
//}

//MARK: -Lo que estamos haciendo es descomponer todos los datos tipo JSON ha tipo Swift para que XCODE pueda leerlo sin problema, creando las distintas clases con las distintas constantes que puede contener cada uno de ellos.


struct UserResponse: Decodable {
    let code: Int?
    let meta: Meta?
    let data: User?
}

struct User: Decodable{
    let id: Int?
    let name: String?
    let email: String?
    let gender: String?
    let status: String?
    let createdAt: Date?
    let updatedAt: Date?
}
//MARK: Esto lo hacemos para poder renombrar nuestras funciones de forma que Swift pueda leerlo
enum CodingKeys: String, CodingKey {
    case id
    case name
    case email
    case gender
    case status
    case createdAt = "created_at"
    case updateAt = "update_at"
}




struct Meta: Decodable{
    
}








