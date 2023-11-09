import SwiftUI

struct CurrentTime {
    let time: Int
    
    init() {
        let formatter_time = DateFormatter()
        formatter_time.dateFormat = "HH"
        if let time = Int(formatter_time.string(from: Date())) {
            self.time = time
        } else {
            self.time = 12
        }
    }
}


