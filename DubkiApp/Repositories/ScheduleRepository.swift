//
//  ScheduleRepository.swift
//  DubkiApp
//
//  Created by Иван Доронин on 12.01.2023.
//

import Foundation
import FirebaseDatabase

class ScheduleRepository: ObservableObject {
    @Published var schedules = [RoteModel]()
    
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    init() {
        loadData()
    }
    
    private lazy var databasePath: DatabaseReference? = {
        Database.database().reference().child("schedule")
    }()
    
    func loadData() {
        guard let databasePath = databasePath else {
            return
        }
        
        databasePath.observe(DataEventType.value) { [weak self] snapshot  in
            guard let self = self, let json = snapshot.value as? [String: Any], let buses = json["buses"] as? [Any] else {
                return
            }
            
            do {
                let roteData = try JSONSerialization.data(withJSONObject: buses)
                
                let rote = try self.decoder.decode([RoteModel].self, from: roteData)
                self.schedules = rote
            }
            catch {
                print("error1")
                print(error.localizedDescription)
            }
        }
    }
    
    func stopLoadData() {
        databasePath?.removeAllObservers()
    }
    
}
