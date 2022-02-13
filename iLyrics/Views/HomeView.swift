//
//  HomeView.swift
//  iLyrics
//
//  Created by Alejo Acosta on 30/04/2021.
//

import SwiftUI
import UIKit
import Network


//Main app view
struct HomeView: View {
    //Service object dependency injection
    @ObservedObject var viewModel = ViewModel(service: LyricsService())
    init() {
        NetworkMonitor.shared.startMonitoring()
    }
    var body: some View {
        TabView {
            VStack(alignment: .leading) {
                HeaderView()
                    .padding(.top, 80)
                    .padding(.bottom, 30)
                FormView(viewModel: self.viewModel)
                Spacer()
            }
           // .background(Color.black)
            .edgesIgnoringSafeArea(.all)
            .tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            HistoryView(vm: self.viewModel)
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("History")
                }
        }
    }
}


struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

