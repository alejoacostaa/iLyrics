//
//  LyricsView.swift
//  iLyrics
//
//  Created by Alejo Acosta on 27/04/2021.
//

import SwiftUI

struct LyricsView: View {
    @State private var liked = false
    @ObservedObject var vm : ViewModel
    let songDetails : SongDetails
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack(spacing: 40) {
                    Image("musicNote")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100,height:100)
                        .cornerRadius(30)
                        .padding()
                    VStack(alignment:.leading) {
                        Text(songDetails.songName)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(.top, 5)
                        Text(songDetails.artistName)
                            .padding(.top, 3)
                            .font(.title2)
                            .foregroundColor(.primary)
                        HStack(spacing: 20) {
                            Text("HOT")
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 60, height: 25)
                                .background(Color(.systemRed))
                                .foregroundColor(.primary)
                                .cornerRadius(10)
                            
                            Text("TRENDING")
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 100, height: 25)
                                .background(Color(.systemGreen))
                                .foregroundColor(.primary)
                                .cornerRadius(10)
                        }
                        .padding(.top, 15)
                        .offset(x: -20)
                    }
                }
                .padding(.top, 30)
                Text("Lyrics")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .padding(.vertical, 20)
                    .padding(.leading, 20)
                ScrollView {
                    Text(songDetails.lyrics)
                        .foregroundColor(.primary)
                        .multilineTextAlignment(.center)
                }
                .padding()
                HStack {
                    Spacer()
                    Link(destination: URL(string: "https://www.youtube.com/results?search_query=\(songDetails.artistName) \(songDetails.songName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)!, label: {
                        Label("Watch on YouTube", systemImage: "video.fill")
                            .font(.headline)
                            .frame(width: 230, height: 50)
                            .background(Color(.systemRed))
                            .foregroundColor(.primary)
                            .cornerRadius(10)
                    })
                    Button(action: {
                        self.liked.toggle()
                    }, label: {
                        Image(systemName: self.liked ? "heart.fill": "heart")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.red)
                            .padding(.horizontal, 20)
                    })
                }
                .padding(.top, 15)
            }
        }
    }
}


//This is for testing purposes only in order to get a live preview of the View without having to re compile the app every time.
struct LyricsView_Previews: PreviewProvider {
    static var previews: some View {
        LyricsView(vm: ViewModel(), songDetails: SongDetails(songName: "The Greatest", artistName: "Sia", lyrics: "I thought that I've been hurt before\r\nBut no one's ever left me quite this sore\r\nYour words cut deeper than a knife\r\nNow I need someone to breathe me back to life\r\nGot a feeling that I'm going under\n\nBut I know that I'll make it out alive\n\nIf I quit calling you my lover\n\nMove on\n\n\n\nYou watch me bleed until I can't breathe, shaking\n\nFalling onto my knees\n\nAnd now that I'm without your kisses\n\nI'll be needing stitches\n\n\n\nTripping over myself, aching\n\nBegging you to come help\n\nAnd now that I'm without your kisses\n\nI'll be needing stitches\n\n\n\nJust like a moth drawn to a flame\n\nOh, you lured me in I couldn't sense the pain\n\nYour bitter heart, cold to the touch\n\nNow I'm gonna reap what I saw\n\nI'm left seeing red on my own\n\n\n\nGot a feeling that I'm going under\n\nBut I know that I'll make it out alive\n\nIf I quit calling you my lover\n\nMove on\n\n\n\nYou watch me bleed until I can't breathe, shaking\n\nFalling onto my knees\n\nAnd now that I'm without your kisses\n\nI'll be needing stitches\n\n\n\nTripping over myself, aching\n\nBegging you to come help\n\nAnd now that I'm without your kisses\n\nI'll be needing stitches\n\n\n\nNeedle and the thread\n\nGotta get you out of my head\n\nNeedle and the thread\n\nGonna wind up dead\n\n\n\nNeedle and the thread\n\nGotta get you out of my head\n\nNeedle and the thread\n\nGonna wind up dead\n\n\n\nNeedle and the thread\n\nGotta get you out of my head\n\nNeedle and the thread\n\nGonna wind up dead\n\n\n\nNeedle and the thread\n\nGotta get you out of my head, get you out of my head\n\n\n\nYou watch me bleed until I can't breathe, shaking\n\nFalling onto my knees\n\nAnd now that I'm without your kisses\n\nI'll be needing stitches\n\n\n\nTripping over myself, aching\n\nBegging you to come help\n\nAnd now that I'm without your kisses\n\nI'll be needing stitches\n\n\n\nNow that I'm without your kisses\n\nI'll be needing stitches\n\nNow that I'm without your kisses\n\nI'll be needing stitches"))
    }
}
