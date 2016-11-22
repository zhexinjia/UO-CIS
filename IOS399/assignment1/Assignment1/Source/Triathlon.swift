//
//  Triathlon.swift
//  Assignment1
//


enum Triathlon{
    case Sprint
    case Olympic
    case HalfIronman
    case Ironman
    
    static let Sports: Array<Sport> = [Sport.Swimming, Sport.Cycling, Sport.Running]
    
    func distanceInMetersForSport(sport: Sport) -> Int{
        let result: Int
        switch (self, sport){
        case (.Sprint, .Swimming):
            result = 750
        case (.Sprint, .Cycling):
            result = 20000
        case (.Sprint, .Running):
            result = 5000
        case (.Olympic, .Swimming):
            result = 1500
        case (.Olympic, .Cycling):
            result = 40000
        case (.Olympic, .Running):
            result = 10000
        case (.HalfIronman, .Swimming):
            result = 1930
        case (.HalfIronman, .Cycling):
            result = 90000
        case (.HalfIronman, .Running):
            result = 21090
        case (.Ironman, .Swimming):
            result = 3860
        case (.Ironman, .Cycling):
            result = 180000
        case (.Ironman, .Running):
            result = 42200
        }
        return result
    }
}