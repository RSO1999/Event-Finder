import SwiftUI

struct ExploreView: View {
    @StateObject private var viewModel = ExploreViewModel()

    var body: some View {

            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(viewModel.cards) { card in
                        NavigationLink(destination: EventDetailView(details: card)) {
                            EventCardView(viewModel: card)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Explore")
            .onAppear {
                viewModel.fetchEvents()
            }
        }
    }



