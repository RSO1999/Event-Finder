import SwiftUI

struct EventSearchView: View {
    @StateObject private var viewModel = EventSearchViewModel()
    @State private var userInputKeyword: String = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                HStack {
                    SwiftUI.Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $userInputKeyword)
                        .onSubmit {
                            let trimmedKeyword = userInputKeyword.trimmingCharacters(in: .whitespacesAndNewlines)
                            guard !trimmedKeyword.isEmpty else { return }
                            viewModel.userSearchesEvents(userInputKeyword: trimmedKeyword)
                            
                        }
                }
                
                .padding(.horizontal)
                .frame(height: 40)
                .background(Color.white)
                .cornerRadius(12)
                .shadow(color: .black.opacity(0.1), radius: 4, x: 0, y: 2)
                .padding(.horizontal)
                
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(viewModel.cards) { card in
                            NavigationLink(destination: EventDetailView(details: card)) {
                                EventCardView(viewModel: card)
                            }
                        }
                        .padding()
                    }
                }
                .background(Color(.systemGray6))
                .navigationTitle("Event Search")
            }
        }
    }
}

