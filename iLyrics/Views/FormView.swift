//
//  FormView.swift
//  iLyrics
//
//  Created by Alejo Acosta on 03/05/2021.
//

import SwiftUI

struct FormView: View {
    
    @State private var songName = ""
    @State private var artistName = ""
    @State private var showingLyricsSheet = false
    @State private var noConnectionAlert = false
    @ObservedObject var viewModel : ViewModel
    var body: some View {
        
        VStack(alignment: .leading, spacing: 25) {
            Text("Search Lyrics")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
            HStack {
                Text("Song Name: ")
                    .foregroundColor(.white)
                
                TextField("Song Name",text: $songName)
                    
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack {
                Text("Artist Name: ")
                    .foregroundColor(.white)
                
                TextField("Artist Name",text: $artistName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                Spacer()
                
                Button(action: {
                    //We check for an active internet connection, if there's none, we wont make any API calls, just alert the user.
                    if(!self.viewModel.checkForInternetAccess()) {
                        self.noConnectionAlert.toggle()
                    } else {
                        //We call the method that makes the whole API calling
                        viewModel.loadApiSongData2(songName: songName, artistName: artistName)
                        
                    }
                }, label: {
                    CustomButton(sfSymbolName: "music.note", text: "Search Lyrics!")
                })
                .alert(isPresented: $viewModel.errorDuringApiCall) {
                    Alert(title: Text("Error"), message: Text("Oops! There was an error grabbing your lyrics. Maybe a typo? Try again!"), dismissButton: .default(Text("Got it!")))
                }
                Spacer()
            }
            .padding(.top, 20)
            //We set the lyrics sheet to render only when we confirm we got valid lyrics from the API call.
            .sheet(item: $viewModel.apiResponse) { item in
                LyricsView(vm: self.viewModel, songName: songName, artistName: artistName, arrLyrics: item.apiValues)
            }
            //"Previous search" Lyrics sheet
            .sheet(isPresented: $showingLyricsSheet) {
                LyricsView(vm: self.viewModel, songName: self.viewModel.searchedSongs.last!.songName, artistName: self.viewModel.searchedSongs.last!.artistName, arrLyrics: [self.viewModel.searchedSongs.last!.lyrics])
            }
            
            Text("Previous Search")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                //Display an alert if the user tries to search lyrics with no internet access
                .alert(isPresented: $noConnectionAlert) {
                    Alert(title: Text("No internet connection"), message: Text("Oops! It seems you arent connected to the internet. Please connect and try again!"), dismissButton: .default(Text("Got it!")))
                }
            if(viewModel.searchedSongs.count < 1) {
                Text("You havent searched any song yet!")
                    .foregroundColor(.white)
                
            } else {
                CustomListCellView(artistName: viewModel.searchedSongs.last!.artistName, songName: viewModel.searchedSongs.last!.songName)
                    .onTapGesture {
                        self.showingLyricsSheet.toggle()
                    }
                
            }
            
            
        }
        .padding()
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView(viewModel: ViewModel())
    }
}
