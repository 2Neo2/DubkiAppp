//
//  ScheduleCellViewModel.swift
//  DubkiApp
//
//  Created by Иван Доронин on 22.01.2023.
//

import SwiftUI

import Combine

extension Date {
    var millisecondsSince1970:Int64 {
        Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    init(milliseconds: Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

class ScheduleCellViewModel: ObservableObject, Identifiable {
    @Published var rote: RoteModel
    
    var direction = ""
    var arrivedStation = ""
    
    var hourIn = 0
    var minutesIn = 0
    
    var arrivedTime = ""
    
    var itemColor = Color(.black)
    
    private var cancellabels = Set<AnyCancellable>()
    
    init(rote: RoteModel) {
        
        self.rote = rote
        
        $rote.compactMap {
            rote in
            switch rote.direction {
            case "msk":
                return "Москва"
                
            case "dbk":
                return "Дубки"
                
            default:
                return "None"
            }
        }
        .assign(to: \.direction, on: self)
        .store(in: &cancellabels)
        
        $rote.compactMap {
            rote in
            switch rote.station {
            case "mld":
                return Color("Mld")
                
            case "slv":
                return Color("Slv")
                
            default:
                return .black
            }
        }
        .assign(to: \.itemColor, on: self)
        .store(in: &cancellabels)
        
        
        $rote.compactMap {
            rote in
            switch rote.station {
            case "odn":
                return "Одинцово"
                
            case "mld":
                return "Молодежная"
                
            case "slv":
                return "Славянский Б."
                
            default:
                return "None"
            }
        }
        .assign(to: \.arrivedStation, on: self)
        .store(in: &cancellabels)
        
        $rote.compactMap {
            rote in
            rote.dayTimeString
        }
        .assign(to: \.arrivedTime, on: self)
        .store(in: &cancellabels)
        
        $rote.compactMap {
            rote in
            let timeIn = Date(milliseconds: (rote.dayTime - (Date().millisecondsSince1970 + 10800000) % 86400000) / 6000)
            
            return Calendar.current.component(.hour, from: timeIn)
        }
        .assign(to: \.hourIn, on: self)
        .store(in: &cancellabels)
        
        $rote.compactMap {
            rote in
            let timeIn = Date(milliseconds: (rote.dayTime - (Date().millisecondsSince1970 + 10800000) % 86400000) / 6000)
            
            return Calendar.current.component(.minute, from: timeIn)
        }
        .assign(to: \.minutesIn, on: self)
        .store(in: &cancellabels)
        
    }
    
}

