//
//  Enums+Extension.swift
//  DubkiApp
//
//  Created by Иван Доронин on 22.01.2023.
//

import Foundation
import SwiftUI

enum MyColors {
    case odi
    case mld
    case slv
    case backgroundCell
}

extension MyColors {
    var value: UIColor {
        get {
            switch self  {
            case .backgroundCell:
                return UIColor(red: 89, green: 101, blue: 241, alpha: 1.0)
                
            case .mld:
                return UIColor(red: 0, green: 132, blue: 25, alpha: 1.0)
                
            case .odi:
                return .black
                
            case .slv:
                return UIColor(red: 0, green: 23, blue: 124, alpha: 1.0)
            }
        }
    }
}
