//
//  ContentView.swift
//  DubkiApp
//
//  Created by Иван Доронин on 07.01.2023.
//

import SwiftUI

struct ScheduleView: View {
    
    @State var directionView = DirectionView()
    @State var categoriesView = CategoriesView()
    
    var body: some View {
        NavigationView {
            VStack {
                directionView
                
                categoriesView
                
                Spacer()
                
                ScheduleListView()
            }
        }
        .navigationViewStyle(.stack)
        .padding(.horizontal, 16)
    }
}

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
