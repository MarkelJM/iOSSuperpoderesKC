import Combine
import Foundation

import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

extension Notification.Name{
    static let myNotification = Notification.Name("Keepcoding-notificacion-test")
}

var mensaje: String = "" {
    didSet{
        print("Nuevo valor : \(mensaje)")
    }
}


let publisher = NotificationCenter.default

    .publisher(for: .myNotification)
    .map{
        $0.object as? String
    }
    .replaceNil(with: "Llega Nil")
    .replaceError(with: "Error")


var suscriber: AnyCancellable?

suscriber = publisher.sink(receiveValue: { data in
    mensaje = data
})
