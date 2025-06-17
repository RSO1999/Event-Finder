

import Foundation

struct EventResponse: Codable {
    let links: ResponseLinks?
    let embedded: EmbeddedEvents?
    let page: Page?

    enum CodingKeys: String, CodingKey {
        case links = "_links"
        case embedded = "_embedded"
        case page
    }
}

struct EmbeddedEvents: Codable {
    let events: [Event]
}

struct Event: Codable {
    let name, type, id: String
    let test: Bool
    let url: String?
    let locale: String
    let images: [Image]
    let sales: Sales?
    let dates: EventDates
    let classifications: [Classification]?
    let promoter: Promoter?
    let links: EventLinks?
    let embedded: EventEmbedded?

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, url, locale, images, sales, dates, classifications, promoter
        case links = "_links"
        case embedded = "_embedded"
    }
}
struct EventDates: Codable {
    let start: EventDateTime?
    let end: EventDateTime?
    let timezone: String?
    let status: DateStatus?
    let spanMultipleDays: Bool?
}

struct EventDateTime: Codable {
    let dateTime: String?
    let localDate: String?
    let localTime: String?
    let dateTBD: Bool?
    let dateTBA: Bool?
    let timeTBA: Bool?
    let noSpecificTime: Bool?
}

struct DateStatus: Codable {
    let code: String?
}


struct Classification: Codable {
    let primary: Bool?
    let segment, genre, subGenre: Genre?
}

struct Genre: Codable {
    let id, name: String
}

struct EventEmbedded: Codable {
    let venues: [Venue]?
    let attractions: [Attraction]?
}

struct Venue: Codable {
    let name, type, id: String
    let test: Bool
    let locale: String
    let postalCode: String?
    let timezone: String?
}

struct Attraction: Codable {
    let name, type, id: String
    let test: Bool
    let locale: String
    let images: [Image]
    let classifications: [Classification]
    let links: AttractionLinks

    enum CodingKeys: String, CodingKey {
        case name, type, id, test, locale, images, classifications
        case links = "_links"
    }
}

struct Image: Codable {
    let ratio: String?
    let url: String?
    let width, height: Int?
    let fallback: Bool?
}


struct Promoter: Codable {
    let id: String
    let name: String?
}

struct Sales: Codable {
    let publicSales: SalePeriod?

    enum CodingKeys: String, CodingKey {
        case publicSales = "public"
    }
}

struct SalePeriod: Codable {
    let startDateTime: String?
    let endDateTime: String?
}

struct EventLinks: Codable {
    let selfLink: SelfElement

    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
    }
}

struct AttractionLinks: Codable {
    let selfLink: SelfElement

    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
    }
}

struct SelfElement: Codable {
    let href: String
}

struct Page: Codable {
    let size, totalElements, totalPages, number: Int
}

struct ResponseLinks: Codable {
    let selfLink: SelfElement
    let next: SelfElement?

    enum CodingKeys: String, CodingKey {
        case selfLink = "self"
        case next
    }
}
