//
//  HeaderView.swift
//  iLyrics
//
//  Created by Alejo Acosta on 03/05/2021.
//

import SwiftUI

struct HeaderView: View {
    let name = "Alejo"
    let lastName = "Acosta"
    @State private var showingAlert = false
    let points = 467
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(self.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(self.lastName)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)

                HStack {
                    Text("Premium")
                        .fontWeight(.bold)
                        .frame(width: 90, height: 30)
                        .background(Color.green)
                        .cornerRadius(7)
                        .foregroundColor(.primary)


                    Image(systemName: "bolt.fill")
                        .foregroundColor(.yellow)
                        .padding(.leading, 10)
                    Text(String(self.points))
                        .foregroundColor(.primary)
                    Text("Points")
                        .foregroundColor(.primary)
                        .font(.callout)
                        .fontWeight(.bold)
                }
                .padding(.top, 13)
            }
            .padding(.horizontal, 20)
            Spacer()

            Image("profilePicture")

                .resizable()
                .scaledToFit()
                .frame(width: 100, height:100)
                .clipShape(Capsule())
                .shadow(radius: 10)
                .padding(.bottom, 50)
                .padding(.trailing, 20)
                .onTapGesture {
                    self.showingAlert.toggle()
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("About Me"), message: Text("Hi ! I'm Alejo, a Junior iOS developer looking for his first iOS Job!"), dismissButton: .default(Text("Nice meeting you!")))
                }

        }

    }

}


struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
