//
//  CustomListCellView.swift
//  iLyrics
//
//  Created by Alejo Acosta on 02/05/2021.
//

import SwiftUI

//To avoid repeating View code, we create a reusable cell that will be used on the previous search section of the app as well as the history part.

struct CustomListCellView: View {
    let artistName : String
    let songName : String
    
    var body: some View {
        HStack {
            Image("musicNote")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .cornerRadius(30)
                .foregroundColor(.white)
            VStack(alignment: .leading) {
                Text(songName)
                    .font(.title2)
                    .fontWeight(.bold)
                
                    .foregroundColor(.white)
                Text(artistName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    
                    .foregroundColor(.white)
            }
            .padding(.leading, 20)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.white)
        }
        .contentShape(Rectangle())
    }
}

struct CustomListCellView_Previews: PreviewProvider {
    static var previews: some View {
        CustomListCellView(artistName: "Adele", songName: "Hello")
    }
}
