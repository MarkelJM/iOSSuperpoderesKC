//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//Modelos

struct BootCamps: Codable {
    let id : UUID
    let name: String
}

final class testLoad {
    func loadBootcamps() async throws -> [BootCamps]{
        let url = URL(string: "https://dragonball.keepcoding.education/api/data/bootcamps")
        let (data, _) = try await  URLSession.shared.data(from: url!)
        return try JSONDecoder().decode([BootCamps].self, from: data)
    }
}
//contexto asinncrono para la ejecucion de codigo concurrente
Task(priority: .high){
    let obj = testLoad()
    let data = try await obj.loadBootcamps()

    data.forEach{ boot in
        
        print("\(boot.name)")
        
    }
}
