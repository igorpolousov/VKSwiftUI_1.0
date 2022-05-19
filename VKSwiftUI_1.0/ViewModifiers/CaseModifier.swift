//
//  CaseModifier.swift
//  VKSwiftUI_1.0
//
//  Created by Igor Polousov on 19.05.2022.
//

import Foundation
import SwiftUI

enum ChooseSringCase {
    case camelCase
    case snakeCase
    case kebabCase
}


@propertyWrapper
struct CaseModifier {
    private(set) var text: String
    private var chooseSringCase: ChooseSringCase
    
    init(wrappedValue: String, chooseCodingCase: ChooseSringCase) {
        text = wrappedValue
        self.chooseSringCase = chooseCodingCase
    }
    
    var wrappedValue: String {
        get {
            get()
        }
        set {
            set(newValue)
        }
    }
    
    private func get() -> String {
        switch chooseSringCase {
        case .camelCase:
            return setUpCamelCase()
        case .kebabCase:
            return setUpKebabCase()
        case .snakeCase:
            return setUpSnakeCase()
        }
    }
    
    private mutating func set(_ newValue: String) {
        text = newValue
    }
    
    private func setUpCamelCase() -> String {
        return text.upperCamelCased
    }
    
    private func setUpKebabCase() -> String {
        return text.kebabCased
    }
    
    private func setUpSnakeCase() -> String {
        return text.snakeCased
    }
    
}
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }
    
    var upperCamelCased: String {
        return lowercased()
            .split(separator: " ")
            .map {  return $0.lowercased().capitalizingFirstLetter()}
            .joined()
    }
    
    var kebabCased: String {
        return replacingOccurrences(of: " ", with: "-")
    }
    
    var snakeCased: String {
        return replacingOccurrences(of: " ", with: "_")
    }
}
