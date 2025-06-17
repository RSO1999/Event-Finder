
import Foundation

enum DateFormatterUtil {
    static func formatDateTime(_ iso: String) -> String {
        let isoFormatter = ISO8601DateFormatter()
        let displayFormatter = DateFormatter()
        displayFormatter.dateStyle = .medium
        displayFormatter.timeStyle = .short

        if let date = isoFormatter.date(from: iso) {
            return displayFormatter.string(from: date)
        }
        return iso
    }
}
