// The Swift Programming Language
// https://docs.swift.org/swift-book

import NotThatAmazingModule

class MyCoolAppLibrary {
    func doSomethingAmazing() {
        let complexJohn = ComplexClass(name: "John", age: 42, favoriteColors: ["Red", "Green", "Blue"])
        complexJohn.greet()
        complexJohn.addFavoriteColor(color: "Yellow")
        complexJohn.removeFavoriteColor(color: "Green")
        complexJohn.sortFavoriteColors()
    }
}