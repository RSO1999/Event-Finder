

import Foundation

@MainActor
class EventSearchViewModel: ObservableObject {
    @Published var cards: [EventCardViewModel] = []
    @Published var isLoading = false

    
    func userSearchesEvents(userInputKeyword: String) {
        
        isLoading = true
        EventService.shared.searchEvents(keyword: userInputKeyword) { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let events):
                    self?.cards = events.map { EventCardViewModel(event: $0) }
                case .failure(let error):
                    print("Failed to search for events: \(error)")
                }
            }
        }
    }
}
