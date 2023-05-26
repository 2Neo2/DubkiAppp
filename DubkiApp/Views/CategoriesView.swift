//
//  Categories.swift
//  DubkiApp
//
//  Created by Иван Доронин on 10.01.2023.
//

import SwiftUI

enum Stations {
    case all
    case odi
    case mol
    case sla
}

struct CategoriesView: View {
    
    @State var station: Stations = .all
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 24) {
                Button("Все", action: { station = .all })
                    .frame(width: 61, height: 26)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 6)
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color("PrimaryColor"), lineWidth: 2))
                    .foregroundColor(station == .all ? .white : Color("PrimaryColor"))
                    .background(station == .all ? RoundedRectangle(cornerRadius: 7).fill(Color("PrimaryColor")) : RoundedRectangle(cornerRadius: 7).fill(.white))
                
                
                Button("Одинцово", action: { station = .odi })
                    .frame(width: 86, height: 26)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 14)
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color("PrimaryColor"), lineWidth: 2))
                    .foregroundColor(station == .odi ? .white : Color("PrimaryColor"))
                    .background(station == .odi ? RoundedRectangle(cornerRadius: 7).fill(Color("PrimaryColor")) : RoundedRectangle(cornerRadius: 7).fill(.white))
                
                
                Button("Молодежная", action: { station = .mol })
                    .frame(width: 104, height: 26)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 15)
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color("PrimaryColor"), lineWidth: 2))
                    .foregroundColor(station == .mol ? .white : Color("PrimaryColor"))
                    .background(station == .mol ? RoundedRectangle(cornerRadius: 7).fill(Color("PrimaryColor")) : RoundedRectangle(cornerRadius: 7).fill(.white))
                
                Button("Славянский б.", action: { station = .sla })
                    .frame(width: 114, height: 26)
                    .padding(.vertical, 6)
                    .padding(.horizontal, 16)
                    .overlay(RoundedRectangle(cornerRadius: 7).stroke(Color("PrimaryColor"), lineWidth: 2))
                    .foregroundColor(station == .sla ? .white : Color("PrimaryColor"))
                    .background(station == .sla ? RoundedRectangle(cornerRadius: 7).fill(Color("PrimaryColor")) : RoundedRectangle(cornerRadius: 7).fill(.white))
            }
        }
        .frame(width: 328).padding(.top, 16)
    }
}

struct Categories_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
