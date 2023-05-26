//
//  ScheduleCellView.swift
//  DubkiApp
//
//  Created by Иван Доронин on 21.01.2023.
//

import SwiftUI

struct ScheduleCellView: View {
    @ObservedObject var scheduleCellVM: ScheduleCellViewModel
    
    var body: some View {
        ZStack(alignment: .topTrailing){
            HStack {
                Image(systemName: "bus")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(scheduleCellVM.itemColor)
                    .padding(.leading, 15)
                
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(scheduleCellVM.direction)
                            .font(.headline)
                            .textCase(.uppercase)
                    }
                    
                    HStack {
                        Text(scheduleCellVM.arrivedStation)
                            .font(.headline)
                            .textCase(.uppercase)
                    }
                }
                
                Text(scheduleCellVM.arrivedTime)
                    .frame(width: 82, height: 38).font(.custom("Roboto", size: 32))
                
            }
            .frame(width: 328, height: 110)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color("BackgroundCell")))

            if (scheduleCellVM.hourIn > 0) {
                Text("Через \(scheduleCellVM.hourIn) часов \(scheduleCellVM.minutesIn) минут")
                    .font(.footnote)
                    .foregroundColor(Color.white)
                    .frame(width: 200, height: 20)
                    .background(RoundedRectangle(cornerRadius: 15).fill(scheduleCellVM.itemColor))
            } else {
                Text("Через \(scheduleCellVM.minutesIn) минут")
                    .font(.footnote)
                    .foregroundColor(Color.white)
                    .frame(width: 110, height: 20)
                    .background(RoundedRectangle(cornerRadius: 15).fill(scheduleCellVM.itemColor))
            }
            
        }
    }
}

struct ScheduleCellView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleCellView(scheduleCellVM: ScheduleCellViewModel(rote: RoteModel(id: 0, day: "d", dayTime: 1, dayTimeString: "6:30", direction: "dbk", station: "mld")))
    }
}
