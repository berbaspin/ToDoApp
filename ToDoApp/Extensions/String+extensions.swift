//
//  String+extensions.swift
//  ToDoApp
//
//  Created by Дмитрий Бабаев on 11.02.2022.
//

import Foundation


extension String {
    var percentEncoded: String {
        let allowedCharacter = CharacterSet(charactersIn: "!@#$%^&*()-+=[]\\}{,./?><").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacter) else { fatalError() }
        return encodedString
    }
}
