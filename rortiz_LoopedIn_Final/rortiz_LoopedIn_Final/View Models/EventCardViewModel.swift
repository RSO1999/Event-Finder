

import UIKit
import Combine

class EventCardViewModel: ObservableObject, Identifiable {
    let id: String
    let name: String
    @Published var image: UIImage? = nil
    let date: String
    let event: Event

    
    
    private var cancellable: AnyCancellable?

    init(event: Event) {
        self.event = event
        self.id = event.id
        self.name = event.name
        self.date = event.dates.start?.localDate ?? "TBD"
        
        if let urlString = event.images.first?.url,
           let url = URL(string: urlString) {
            loadImage(from: url)
        }
    }
    
    private func loadImage(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
}
