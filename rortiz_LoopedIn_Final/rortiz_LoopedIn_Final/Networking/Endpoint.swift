
//Endpoint.swift

import Foundation

enum Endpoint {
    case popularEvents(city: String, size: Int)
    case searchEvents(keyword: String, city: String)
    

    var url: URL? {
        var components = URLComponents(string: "https://app.ticketmaster.com/discovery/v2/events.json")
        // Personal API key was removed for security purposes
        // Insert new api key in 'value'
        var queryItems = [URLQueryItem(name: "apikey", value: "YOUR_API_KEY_HERE")] //<--- Insert Your API Key

        switch self {
        case .popularEvents(let city, let size):
            queryItems += [
                URLQueryItem(name: "city", value: city),
                URLQueryItem(name: "size", value: "\(size)"),

                
            ]
        case .searchEvents(let keyword, let city):
            queryItems += [
                URLQueryItem(name: "keyword", value: keyword),
                URLQueryItem(name: "city", value: city)
            ]
        }

        components?.queryItems = queryItems
        return components?.url
    }
}
