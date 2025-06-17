//
//  EventCardView.swift
//  rortiz_LoopedIn_Final
//
//  Created by Ryan Ortiz on 6/8/25.
//

import SwiftUI

struct EventCardView: View {
    @ObservedObject var viewModel: EventCardViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(viewModel.name)
                .font(.headline)

            if let image = viewModel.image, image.size.width > 0 {
                SwiftUI.Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 150)
                    .clipped()
                    .cornerRadius(8)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 150)
                    .cornerRadius(8)
            }

            Text(viewModel.date)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemGray5))
        .cornerRadius(12)
    }
}
