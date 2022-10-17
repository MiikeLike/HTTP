//
//  DataDecoder.swift
//  HTTP
//
//  Created by Mikel Valle on 5/10/22.
//

import Foundation

final class DataDecoder: JSONDecoder{
    
    let dateFormatter = DateFormatter()
    
    override init() {
        super.init()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXX" //Formato estandar para fechas, siempre indicando como debe transformarse.
        dateDecodingStrategy = .formatted(dateFormatter)
    }
}
