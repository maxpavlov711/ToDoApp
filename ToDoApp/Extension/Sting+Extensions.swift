//
//  Sting+Extensions.swift
//  ToDoApp
//
//  Created by Max Pavlov on 16.03.22.
//

import Foundation

extension String {
    var percentEncoding: String {
        let allowedCharacters = CharacterSet(charactersIn: "±!@#$%^&*()§-+=[]\\}{`~,.?><").inverted
        guard let encodedString = self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
        else { fatalError() }
        return encodedString
    }
}
