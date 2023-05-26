//
//  HomeView.swift
//  DubkiApp
//
//  Created by Иван Доронин on 13.01.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ScheduleView()
                .tabItem {
                    Image(systemName: "bus")
                    Text("Расписание")
                }
            
            MarketView()
                .tabItem {
                    Image(systemName: "square.grid.2x2.fill")
                    Text("Барахолка")
                }
            
            NotificationView()
                .tabItem {
                Image(systemName: "bell")
                Text("Уведомления")
            }
        }
        .accentColor(Color("PrimaryColor"))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
