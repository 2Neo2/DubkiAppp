//
//  DirectionView.swift
//  DubkiApp
//
//  Created by Иван Доронин on 10.01.2023.
//

import SwiftUI

struct DirectionView: View {
    enum DirectionType {
            case toMoscow
            case toDubki
        }
    
    @State var directionType: DirectionType = .toMoscow
    
    var body: some View {
        VStack {
            CustomSegmentedControl(selection: $directionType) {
                Text("В Москву").segmentedControlItemTag(DirectionType.toMoscow)
                Text("В Дубки").segmentedControlItemTag(DirectionType.toDubki)
            }.onChange(of: directionType) { newValue in
                print(newValue)
            }
        }
    }
}

struct DirectionView_Previews: PreviewProvider {
    static var previews: some View {
        DirectionView()
    }
}
