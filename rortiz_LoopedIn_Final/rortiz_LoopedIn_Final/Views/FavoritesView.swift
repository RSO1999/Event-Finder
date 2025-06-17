import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query var favorites: [FavoriteEvent]
    
    var body: some View {
        NavigationStack {
            List(favorites) { fav in
                if let urlString = fav.ticketURL, let url = URL(string: urlString) {
                    Link(destination: url) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(fav.name)
                                .font(.headline)
                            Text("📅 \(fav.date)\(fav.time.map { " at \($0)" } ?? "")")
                            if let venue = fav.venueName {
                                Text("📍 \(venue)")
                            }
                            if let start = fav.salesStart {
                                Text("🎟️ Sales Start: \(DateFormatterUtil.formatDateTime(start))")
                            }
                        }
                        .padding(.vertical, 8)
                    }
                } else {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(fav.name)
                            .font(.headline)
                        Text("📅 \(fav.date)\(fav.time.map { " at \($0)" } ?? "")")
                        if let venue = fav.venueName {
                            Text("📍 \(venue)")
                        }
                        if let start = fav.salesStart {
                            Text("🎟️ Sales Start: \(DateFormatterUtil.formatDateTime(start))")
                        }
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

