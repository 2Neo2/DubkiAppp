//
//  ScheduleListViewModel.swift
//  DubkiApp
//
//  Created by Иван Доронин on 21.01.2023.
//

import Foundation
import Combine


class ScheduleListViewModel: ObservableObject {
    @Published var scheduleRepository = ScheduleRepository()
    @Published var scheduleCellsVM = [ScheduleCellViewModel]()
    
    private var cancellabels = Set<AnyCancellable>()
    
    init() {
        scheduleRepository.$schedules.map {
            schedules in
            schedules.map {
                schedule in
                ScheduleCellViewModel(rote: schedule)
            }
        }
        .assign(to: \.scheduleCellsVM, on: self)
        .store(in: &cancellabels)
    }

}
