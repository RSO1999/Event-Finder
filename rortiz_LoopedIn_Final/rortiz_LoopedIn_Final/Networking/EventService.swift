
import Foundation

final class EventService {
    static let shared = EventService()

    func fetchPopularEvents(completion: @escaping (Result<[Event], NetworkError>) -> Void) {
        guard let url = Endpoint.popularEvents(city: "Chicago", size: 100).url else {
            completion(.failure(.invalidURL))
            return
        }
    
        APIClient.shared.request(url) { (result: Result<EventResponse, NetworkError>) in
            switch result {
            case .success(let response):
                let events = response.embedded?.events ?? []
                completion(.success(events))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func searchEvents(keyword: String, completion: @escaping (Result<[Event], NetworkError>) -> Void) {
        guard let url = Endpoint.searchEvents(keyword: keyword, city: "Chicago").url else {
            completion(.failure(.invalidURL))
            return
        }

        APIClient.shared.request(url) { (result: Result<EventResponse, NetworkError>) in
            switch result {
            case .success(let response):
                let events = response.embedded?.events ?? []
                completion(.success(events))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
