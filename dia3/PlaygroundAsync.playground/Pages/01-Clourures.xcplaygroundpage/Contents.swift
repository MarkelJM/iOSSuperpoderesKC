//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//Modelos

struct BootCamps: Codable {
    let id : UUID
    let name: String
}

//Defino typealias

typealias succesClousure = ([ BootCamps]) -> Void
typealias errorClousure = (()-> Void)?

//Extension URLResponse

extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}

final class testLoad{
    
    func LoadBootCamps(onSuccess: @escaping succesClousure, onError: errorClousure){
        let url = URL(string: "https://dragonball.keepcoding.education/api/data/bootcamps")
        
        var request : URLRequest = URLRequest(url: url!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { data, response,
            error in
            
            if error != nil {
                onError!() // ejecuto la closure y la desempaqueto antes
                return
            }
            if (response?.getStatusCode() == 200){
                //OK
                do {
                    if let datos = data {
                        let responseData = try JSONDecoder().decode([BootCamps].self, from: datos)
                        onSuccess(responseData)
                    }
                    
                } catch {
                    onError!()
                }
            }else {
                onError!()
                return
            }
            
        }
        task.resume()
        
    }
    
}


//usamos la clase

let obj = testLoad()
obj.LoadBootCamps{ data in
    //success
    DispatchQueue.main.async {
        print("Success")
        data.forEach{bootcamp in
            print("\(bootcamp.name)")
        }
    }
} onError: {
    //error
    DispatchQueue.main.async {
        print("error")
    }
}
