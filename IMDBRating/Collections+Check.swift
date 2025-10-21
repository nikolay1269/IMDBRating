import Foundation

extension RandomAccessCollection where Self.Element: Identifiable {
    func needToLoad<Item: Identifiable>(_ elem: Item) -> Bool {
        guard isEmpty == false else { return false }
        guard let itemIndex = firstIndex(where: {
            AnyHashable($0.id) == AnyHashable(elem.id)
        }) else { return false }

        let distance = self.distance(from: itemIndex, to: endIndex)
        return distance == 1
    }
}
