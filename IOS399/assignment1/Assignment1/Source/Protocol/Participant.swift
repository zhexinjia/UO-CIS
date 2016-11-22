//
//  Participant.swift
//  Assignment1
//

protocol Participant {
    init(name: String)
    func timeInMinutesToCompleteSport(sport: Sport, inTriathlon triathlon: Triathlon, randomValue value: Double) -> Int
    var name: String { get }
    var favoriteSport: Sport? { get }
}



extension Participant{
    func metersPerMinuteForSport(sport: Sport, randomValue value: Double = Double.random()) -> Int {
        var speed: Int
        var modiyfiledNum: Double = 0.85 + value*0.3
        switch(sport){
        case .Swimming:
            speed = 43
        case .Cycling:
            speed = 500
        case .Running:
            speed = 157
        }
        if (self.favoriteSport != nil && self.favoriteSport == sport){
            modiyfiledNum = modiyfiledNum - 0.05
        }
        if (self.favoriteSport != nil && self.favoriteSport != sport){
            modiyfiledNum = modiyfiledNum + 0.1
        }
        let temp = Double(speed) * modiyfiledNum
        let finalspeed = Int(temp)
        return finalspeed
    }
    
    func timeInMinutesToCompleteSport(sport: Sport, inTriathlon triathlon: Triathlon) -> Int{
        let result = timeInMinutesToCompleteSport(sport, inTriathlon: triathlon, randomValue: Double.random())
        return result
    }
    
    func timeInMinutesToCompleteSport(sport: Sport, inTriathlon triathlon: Triathlon, randomValue value: Double) -> Int{
        return triathlon.distanceInMetersForSport(sport)/metersPerMinuteForSport(sport, randomValue: value)
    }
    
}