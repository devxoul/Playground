import Foundation

/// https://gist.github.com/devxoul/a1e6822def36f75d0bc5
public extension String {

  /// Returns a titlecased string.
  ///
  ///     "we're having dinner in the garden".titlecaseString // We're Having Dinner In The Garden
  ///     "TheSwiftProgrammingLanguage" // The Swift Programming Language
  func titlecased() -> String {
    if self.count <= 1 {
      return self.uppercased()
    }

    let regex = try! NSRegularExpression(pattern: "(?=\\S)[A-Z]", options: [])
    let range = NSMakeRange(1, self.count - 1)
    var titlecased = regex.stringByReplacingMatches(in: self, range: range, withTemplate: " $0")

    for i in titlecased.indices {
      if i == titlecased.startIndex || titlecased[titlecased.index(before: i)] == " " {
        titlecased.replaceSubrange(i...i, with: String(titlecased[i]).uppercased())
      }
    }
    return titlecased
  }
}
