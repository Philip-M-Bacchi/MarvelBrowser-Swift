//  TDD sample app MarvelBrowser-Swift by Jon Reid, http://qualitycoding.org/about/
//  Copyright 2016 Jonathan M. Reid. See LICENSE.txt

class FetchCharactersResponseDataBuilder {
    var offset: Int?
    var total: Int?
    var results: [CharacterResponseBuilder]?

    init(dictionary dict: [String: Any]) {
        offset = dict["offset"] as? Int
        total = dict["total"] as? Int
        results = parseResults(from: dict["results"] as? Array<[String: Any]>)
    }

    private func parseResults(from array: Array<[String: Any]>?) -> [CharacterResponseBuilder]? {
        return array?.map() { return CharacterResponseBuilder(dictionary: $0) }
    }

    func buildCharacters() -> [CharacterResponse] {
        return results?.flatMap() { $0.build() } ?? []
    }
}
