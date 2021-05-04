//
//  Button.swift
//  iLyrics
//
//  Created by Alejo Acosta on 30/04/2021.
//

import SwiftUI

struct CustomButton: View {
    
    let sfSymbolName : String
    let text : String
    var body: some View {
        HStack {
            Image(systemName: self.sfSymbolName)
            Text(self.text)
        }
        
        .font(.headline)
        .frame(width: 230, height: 50)
        .background(Color(.systemRed))
        .foregroundColor(Color.white)
        .cornerRadius(10)
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(sfSymbolName: "music.note", text: "Search Lyrics!")
    }
}
