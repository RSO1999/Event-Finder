

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationStack {
            
            VStack(spacing: 20) {

                NavigationLink(destination: ExploreView()) {
                    Text("Explore")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: EventSearchView()) {
                    Text("Search")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: FavoritesView()) {
                    Text("Favorites")
                        .font(.title2)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
            }
            .background(Color(.systemGray6))

            .padding()
            .navigationTitle("Home")
        }

    }
}
