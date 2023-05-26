//
//  ScheduleListView.swift
//  DubkiApp
//
//  Created by Иван Доронин on 21.01.2023.
//

import SwiftUI

struct ScheduleListView: View {
    @ObservedObject var scheduleListVM =  ScheduleListViewModel()
    
    var body: some View {
        ScrollView {
            ForEach(scheduleListVM.scheduleCellsVM) { scheduleCellVM in
                ScheduleCellView(scheduleCellVM: scheduleCellVM)
            }
        }
        .padding(16)
    }
}

struct ScheduleListView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListView()
    }
}
