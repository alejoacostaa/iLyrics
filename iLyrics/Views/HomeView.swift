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
    @ObservedObject var viewModel = ViewModel()
    init() {
        NetworkMonitor.shared.startMonitoring()
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor.black
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
            .background(Color.black)
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
        .accentColor(.white)
    }
}


struct HomeView2_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

