/*:
[Previous](@previous)

# TriathlonEvent class

The `TriathlonEvent` class implements the functionality necessary to simulate a triathlon race event.  Open the TriathlonEvent.swift file that already exists in this project and implement the `TriathlonEvent` class as described below.

1. The class will implement a constant property named `triathlon` of the type `Triathlon` with no initial value defined.

2. The class will implement an initializer that takes a parameter with the identifier `triathlon` of type `Triathlon` and set the initial value of the `triathlon` property to the value passed as a parameter.

3. The class will implement a variable property named `eventPerformed` of the type `Bool` with the initial value of `false`.  This variable should have public access for reading and private access for writing.  Hint: this is accomplished by adding the `private(set)` keyword before the `var` keyword.

4. The class will implement a method that can be used to register a `Participant` in the event.  This method should be named `registerParticipant`, and take a single parameter of type `Participant`.  The implementation of this method should add this participant to the event and give them an initial time of 0 minutes.  This method should guard against being called if `eventPerformed` is true.

5. The class will implement a computed property named `registeredParticipants` of type `[Participant]` that only specifies a get block which returns an array of all currently registered participants.

6. The class will implement a method that simulates one sport of the triathlon for a specific participant with some random variance.  This method should be named `runSport`, take a first parameter of type `Sport`, a second parameter with the label `forParticipant` of type `Participant`, and a third parameter with the label `randomValue` of type `Double` which has a default value of `Double.random()`.  The if the sport passed as a parameter is equal to the participant passed as a parameter's favorite sport or the random value is >= 0.05 the implementation should call the `timeInMinutesToCompleteSport_:inTriathlon:)` method on the participant passed as a parameter for the sport passed as a parameter.  This time should then be added to the participants event time (which was initialized to 0 upon registration).  If the sport passed as a parameter is not the participant passed as a parameter's favorite sport and the random value is < 0.05, the participants event time should be set to nil to indicate they have failed at the sport and dropped out of the race.  This method should guard against being called for a participant whose event time is already nil.  The method should print the text "<participant name> is about to being <sport>".  If the participant finishes the sport the method should print the text "<participant name> finished the <sport> event in <time for sport> minutes; their total race time is now <event time> minutes."  If the participant des not finish the sport the method should print the text "<participant name> could not finish the <sport> event, and will not finish the race.".

7. The class will implement a method that simulates the entire triathlon event for all registered participants.  This method should be named `performEvent` and take no parameters.  The implementation of this method should loop through `Triathlon.Sports` and for each sport loop through all registered participants calling the `runSport(_:forParticipant:)` method.  After running each participant through each sport, it should set the `eventPerformed` variable to `true`.  This method should guard against being called if `eventPerformed` is already `true`.

8. The class will implement a computed property named `winner` of type `Participant?` that only specifies a get block which determines the winner of the triathlon event based on all the participant event times.  A participant with a nil event time should never win.  If two or more participants are tied with the same winning event time, the one who registered first should win.  It is possible for no participant to win if the event time for all participants is set to nil during `performEvent()`, although this should be extremely rare in practice.  This computed property should guard against being called if `eventPerformed` is `false`.

The next page will describe how to [implement the Main.swift file](@next).
*/
