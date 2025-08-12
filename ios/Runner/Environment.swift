//
//  Environment.swift
//  Runner
//
//  Created by Andrianaivo Andoniriana Andrianina on 12/08/2025.
//

import Foundation

public enum Environment {
    enum Keys {
        static let mapApiKey = "MAP_API_KEY"
    }
    
    private static let infoDictonary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("plist file not found")
        }
        return dict
    }()
    
    static let mapApiKey: String = {
        guard let value = infoDictonary[Keys.mapApiKey] as? String else {
            fatalError("MAP_API_KEY not found in Info.plist")
        }
        return value
    }()
}
