
import Foundation

@MainActor
class ExploreViewModel: ObservableObject {
    @Published var cards: [EventCardViewModel] = []
    @Published var isLoading = false

    func fetchEvents() {
        isLoading = true
        EventService.shared.fetchPopularEvents { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let events):
                    self?.cards = events.map { EventCardViewModel(event: $0) }
                case .failure(let error):
                    print("Failed to fetch events: \(error)")
                }
            }
        }
    }
}
