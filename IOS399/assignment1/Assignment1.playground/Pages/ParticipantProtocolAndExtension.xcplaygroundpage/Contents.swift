/*:
[Previous](@previous)

# Participant protocol and extension

### Participant protocol

The `Participant` protocol defines a set of methods and properties that must be implemented by a type in order to be a `Participant` in a `TriathlonEvent`.  Open the Participant.swift file that already exists in this project and implement the `Participant` protocol as described below.

1. The `Participant` protocol should require an initializer that takes a parameter with the identifier `name` of type `String`.
2. The `Participant` protocol should require a method named `timeInMinutesToCompleteSport` that takes a first parameter of type `Sport`, a second parameter with the label `inTriathlon` of type `Triathlon`, a third parameter with the label `randomValue` of type `Double`, and returns a value of type `Int`.  Note that the `randomValue` parameter will be used by the unit tests in the project to pass known values which will remove the randomization during testing.
3. The `Participant` protocol should require a variable named `name` of type `String` that provides at least a `get` implementation.
4. The `Participant` protocol should require a variable named `favoriteSport` of the optional type `Sport?` that provides a `get` implementation.

### Extension of Participant

The extension to the `Participant` protocol defines default functionality that will be added to any type conforming to the `Participant` protocol if that type does not provide its own implementation of that functionality.  Add your implementation of the extension to the `Participant` protocol below your `Participant` protocol implementation in the same file.

1. The extension will add a method not declared in the `Participant` protocol that can be used to get the number of meters per minute for a given sport with some random variation.  This method should be named `metersPerMinuteForSport`, take a first parameter of type `Sport`, a second parameter with the label `randomValue` of type `Double` which has a default value of `Double.random()`, and return a value of type `Int`.  The implementation of this method should return a value from the list below based on the passed `Sport` instance.  The value should be multiplied by a modifier based on the passed random value (which will be in the range of 0.0 - 1.0).  The modifier should be 0.85 plus a randomized value in the range of 0.0 to 0.3 (i.e., the modifier will have the range 0.85 to 1.15 in the general case).  If `self.favoriteSport` is non-nil and equal to the parameter of type `Sport` that was passed the multiple should be then reduced by 0.05 (i.e., the modifier will have a range of 0.8 to 1.1 if the sport is the favorite).  If `self.favoriteSport` is non-nill and _not_ equal to the parameter of type `Sport` that was passed the multiplier should be then increased by 0.1 (i.e., the modifier will have the range of 0.95 to 1.25 if the sport is not the favorite).

	* Swimming: 43 meters per minute
	* Cycling: 500 meters per minute
	* Running: 157 meters per minute

2. The extension will provide a version of the `timeInMinutesToCompleteSport(_:inTriathlon:randomValue:)` function without the third parameter for convenience.  Add a method with the name `timeInMinutesToCompleteSport` that takes a first parameter of type `Sport`, a second parameter with the label `inTriathlon` of type `Triathlon`, and returns a value of type `Int`.  The implementation of this method should call the version of the method that takes all three parameters, passing through the two parameters it was invoked with for the first two parameters and `Double.random()` for the third parameter.

3. The extensions will also provide a default implementation of the `timeInMinutesToCompleteSport(_:inTriathlon:randomValue:)` function as declared in the `Participant` protocol.  The implementation of this method should call the `distanceInMetersForSport(_:)` method on the passed `Triathlon` instance with the passed `Sport` instance as the parameter value, call the `metersPerMinuteForSport(_:randomValue:)` method with the passed `Sport` instance and `Double` instance as the parameter values, and then return the result of dividing the former by the latter.

The next page will describe how to [implement the Athlete class](@next).
*/
