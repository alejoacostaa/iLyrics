//
//  HistoryView.swift
//  iLyrics
//
//  Created by Alejo Acosta on 02/05/2021.
//

import SwiftUI


struct HistoryView: View {
    @ObservedObject var vm : ViewModel
    init(vm : ViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        
        ZStack(alignment: .top) {
            VStack(alignment: .leading) {
                HStack {
                    Text("History")
                        .foregroundColor(.primary)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding(.top, 50)
                .padding(.leading, 30)
                
                ScrollView {
                    //Ideally, this would have been done using a SwiftUI List (UIKit's UITableView equivalent). However, List seems to be pretty buggy as of now when theres a hardcoded background color (such as black in this case/app). There are some "hacky solutions" or workarounds that rely on UIKit but, since this was a pretty simple "list", I decided to just avoid it entirely.
                    
                    //Since we want history to be sorted by date (latest search at the top, we loop over the searchedSongs array, but reversed)
                    
                    ForEach(vm.searchedSongs.reversed()) { song in
                        CustomListCellView(artistName: song.artistName, songName: song.songName)
                            .onTapGesture {
                                vm.getSong(songName: song.songName)
                            }
                            .padding(.leading, 30)
                            .padding(.top, 15)
                    }
                    .sheet(item: $vm.lyricsHistory) { songDetails in
                        LyricsView(vm: self.vm, songDetails: songDetails)
                    }
                }
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        
        HistoryView(vm: ViewModel())
    }
}
