//
//  NetworkingProvider.swift
//  HTTP
//
//  Created by Mikel Valle on 4/10/22.
//

import Foundation
import Alamofire

final class NetworkingProvider {
    //Función para conectar con la url y recuperar información
    static let shared = NetworkingProvider()
    private let KStatusOk = 200...299
    private let kBaseUrl = "https://gorest.co.in/public/v2/"
    
    func getUser(id: Int, success: @escaping (_ user: User ) -> (), failure: @escaping (_ error: Error? ) -> ()) {
        
        let url = "\(kBaseUrl)users/\(id)"
        //interpolamos la url base el usuario y el id para un unico usuario
        print(url)
        AF.request(url, method: .get).validate(statusCode: KStatusOk).responseDecodable (of: UserResponse.self){ response in
          //Decodable quiere decir que ese objeto puede transformarse de JSON a Swift para que lo pueda leer Xcode
            
            //Comprobamos si hemos obtenido un usuario
            if let user = response.value?.data {
               success(user)
            }else{
                failure(response.error)
            }
        }
    }
    func addUsers(user: NewUser, success: @escaping (_ user: User ) -> (), failure: @escaping (_ error: Error? ) -> ()) {
        let url = "\(kBaseUrl)users"
        //Aquí cambiamos el metodo method por post y introducimos parameters especificando user, siempre que en el nuevo archivo le añadas encodable en NewUser
        AF.request(url, method: .post, parameters: user, encoder: JSONParameterEncoder.default).validate(statusCode: KStatusOk).responseDecodable (of: UserResponse.self){ response in
          //Decodable quiere decir que ese objeto puede transformarse de JSON a Swift para que lo pueda leer Xcode
            
            //Comprobamos si hemos obtenido un usuario
            if let user = response.value?.data {
               success(user)
            }else{
                failure(response.error)
            }
        
    }
}
}
