//
//  Logger.swift
//  ExchangeApp
//
//  Created by Alexander on 28.12.2022.
//

import Foundation

enum Logger {
    
    static func info(
        message: Any,
        file: String = #file,
        line: Int = #line
    ) {
        let fileName = file.components(separatedBy: "/").last ?? ""
        print("🟦 [\(fileName)] line \(line) -", message)
    }
    
    static func error(
        message: Any,
        file: String = #file,
        line: Int = #line
    ) {
        let fileName = file.components(separatedBy: "/").last ?? ""
        print("🟥 [\(fileName)] line \(line) -", message)
    }
    
}
