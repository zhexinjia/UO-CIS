//
//  Sport.swift
//  Assignment1
//

enum Sport {
    case Swimming
    case Cycling
    case Running
    
    var description: String{
        let result: String
        switch self {
        case .Swimming:
            result = "swimming"
        case .Cycling:
            result = "cycling"
        case .Running:
            result = "running"
        }
        return result
    }
}
