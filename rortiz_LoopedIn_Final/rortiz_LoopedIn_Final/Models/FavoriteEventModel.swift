
import Foundation
import SwiftData

@Model
class FavoriteEvent: Identifiable {
    var id: String
    var name: String
    var date: String
    var time: String?
    var timezone: String?
    
    var venueName: String?
    var venuePostalCode: String?
    
    var salesStart: String?
    var salesEnd: String?
    
    var ticketURL: String?
    var imageURL: String?
    
    init(id: String, name: String, date: String, time: String? = nil, timezone: String? = nil, venueName: String? = nil, venuePostalCode: String? = nil, salesStart: String? = nil, salesEnd: String? = nil, ticketURL: String? = nil, imageURL: String? = nil) {
        self.id = id
        self.name = name
        self.date = date
        self.time = time
        self.timezone = timezone
        self.venueName = venueName
        self.venuePostalCode = venuePostalCode
        self.salesStart = salesStart
        self.salesEnd = salesEnd
        self.ticketURL = ticketURL
        self.imageURL = imageURL
    }
}

