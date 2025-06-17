import SwiftUI


struct EventDetailView: View {
    let details: EventCardViewModel
    @Environment(\.modelContext) private var modelContext


    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {

                Button {
                    let fav = FavoriteEvent(
                        id: details.id,
                        name: details.name,
                        date: details.date,
                        time: details.event.dates.start?.localTime,
                        timezone: details.event.dates.timezone,
                        venueName: details.event.embedded?.venues?.first?.name,
                        venuePostalCode: details.event.embedded?.venues?.first?.postalCode,
                        salesStart: details.event.sales?.publicSales?.startDateTime,
                        salesEnd: details.event.sales?.publicSales?.endDateTime,
                        ticketURL: details.event.url,
                        imageURL: details.event.images.first?.url
                    )
                    modelContext.insert(fav)
                    try? modelContext.save()
                    
                } label: {
                    Label("Add to Favorites", systemImage: "heart.fill")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.red)
                        .cornerRadius(10)
                }

                
                if let image = details.image {
                    GeometryReader { geometry in
                        SwiftUI.Image(uiImage: image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width, height: 250)
                            .clipped()
                            .cornerRadius(12)
                    }
                    .frame(height: 250)
                }

                Text(details.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .fixedSize(horizontal: false, vertical: true)

                Text("Event ID: \(details.id)")
                    .font(.caption)
                    .foregroundColor(.gray)

                Divider()

                VStack(alignment: .leading, spacing: 4) {
                    Text("📅 Date: \(details.date)")
                    if let time = details.event.dates.start?.localTime {
                        Text("🕒 Time: \(time)")
                    }
                    if let timezone = details.event.dates.timezone {
                        Text("🌐 Timezone: \(timezone)")
                    }
                }

                Divider()

                if let venue = details.event.embedded?.venues?.first {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("📍 Venue")
                            .font(.headline)
                        Text("\(venue.name)")
                        if let postal = venue.postalCode {
                              Text("ZIP: \(postal)")
                          }
                    
                    }
                }

                Divider()

                if let sales = details.event.sales?.publicSales {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("🎟️ Ticket Sales")
                            .font(.headline)
                        if let start = sales.startDateTime {
                            Text("Start: \(DateFormatterUtil.formatDateTime(start))")
                        }
                        if let end = sales.endDateTime {
                            Text("End: \(DateFormatterUtil.formatDateTime(end))")
                        }
                    }
                }

                Divider()

                if let urlString = details.event.url,
                   let url = URL(string: urlString) {
                    Link(destination: url) {
                        Label("Buy Tickets", systemImage: "ticket.fill")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                }

                Spacer(minLength: 20)
            }
            .padding()
        }
        .navigationTitle("Event Details")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(.systemGroupedBackground))
    }


}

