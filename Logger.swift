//
//  Logger.swift
//  PatientEscort
//
//  Created by 이성근 on 2017. 7. 25..
//  Copyright ⓒ 2017년 이성근. All rights reserved.
//

import Foundation


/// 로그 표현 형식
///
///  Logger.info(message: "init")
///
///  [INFO] = "init" 2017. 2. 3. 오후 11:54:21 viewDidLoad() ViewController.swift:(23)
///
///  Logger.debug(message: "deinit")
///
///  [DEBUG] = "deinit" 2017. 2. 3. 오후 11:54:21 viewDidLoad() ViewController.swift:(25)

class Logger {

    static let isPrintLog = true
    
    class func debug(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if Logger.isPrintLog {
            Logger.write(loglevel: "[DEBUG]", message: message, function: function, file: file, line: line)
        }
    };
    
    class func info(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if Logger.isPrintLog {
            Logger.write(loglevel: "[INFO]", message: message, function: function, file: file, line: line)
        }
    }
    class func warning(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if Logger.isPrintLog {
            Logger.write(loglevel: "[WARNING]", message: message, function: function, file: file, line: line)
        }
    };
    
    class func error(message: String, function: String = #function, file: String = #file, line: Int = #line) {
        if Logger.isPrintLog {
            Logger.write(loglevel: "[ERROR]", message: message, function: function, file: file, line: line)
        }
    }
    
    class func write(loglevel: String, message: String, function: String, file: String, line: Int) {
        let now = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ko_KR") as Locale!
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        
        let nowdate = dateFormatter.string(from: now as Date)
        
        var filename = file
        if let match = filename.range(of: "[^/]*$", options: .regularExpression) {
            filename = filename.substring(with: match)
        }
        
        print("\(loglevel)\t \(message) \n\(nowdate) \(function) \(filename):(\(line))")
    }
}
