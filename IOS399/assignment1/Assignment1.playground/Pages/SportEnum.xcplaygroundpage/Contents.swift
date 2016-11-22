/*:
[Previous](@previous)

# Sport enum

The `Sport` enum contains the collection of constants representing the three sports that are part of a triathlon.  It should contain three different enum cases: `Swimming`, `Cycling`, and `Running`.  Open the Sport.swift file that already exists in this project and implement the `Sport` enum.

The only additional code necessary in the `Sport` enum is the adoption of a protocol from the Swift standard library that allows for it to be easily printed to the console output.  Modify your `Sport` enum implementation to conform to the `CustomStringConvertible` protocol and implement the single requirement defined in the `CustomStringConvertible` protocol:

`public var description: String { get }`

The `Swimming` case should return the `String` "swimming", the `Cycling` case should return the `String` "cycling", and the `Running` case should return the `String` "running".  

The next page will describe how to [implement the Triathlon enum](@next).
*/
