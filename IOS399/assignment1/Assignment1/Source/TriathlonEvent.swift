//
//  TriathlonEvent.swift
//  Assignment1
//

import Foundation

class TriathlonEvent{
    
    let triathlon: Triathlon
    var participantArray: [Participant] = []
    var participantTime: [Int?] = []
    
    init(triathlon: Triathlon){
        self.triathlon = triathlon
    }
    
    private (set) var eventPerformed: Bool = false;
    
    
    func registerParticipant(participant: Participant) {
        guard eventPerformed == false else{
            return
        }
        
        participantArray.append(participant)
        participantTime.append(0)
        
    }
   
    var registeredParticipants: [Participant]{
        get{
            return participantArray
        }
    }
    
    func runSport(sport: Sport, forParticipant participant: Participant, randomValue num:Double = Double.random()){
        let index = participantArray.indexOf{$0.name == participant.name}
        guard participantTime[index!] != nil else{
            return
        }
        
        print(participant.name + " is about to being " + sport.description)
        if sport == participant.favoriteSport || num >= 0.05{
            let time: Int = participant.timeInMinutesToCompleteSport(sport, inTriathlon: triathlon)
            participantTime[index!] = participantTime[index!]! + time;
            
            var statement = participant.name + " finished the" + sport.description + " event in " + String(time) + " minutes; their total race time is now ";
            statement += String(participantTime[index!]!) + " minutes."
                    
            print(statement)
                
        }else if sport != participant.favoriteSport && num < 0.05{
            participantTime[index!] = nil;
            let statement = participant.name + " could not finish the " + sport.description + " event, and will not finish the race."
            print(statement)
        }
        
    }
    
    func performEvent(){
        guard eventPerformed != true else {
            return
        }
      
        for sports in Triathlon.Sports{
            for registered in participantArray{
                runSport(sports, forParticipant: registered)
            }
        }
        eventPerformed = true
        
    }
    
    var winner: Participant?{
        get{
            guard eventPerformed == true else{
                return nil
            }
            var index: Int?
            var min: Int? = participantTime[0]
            for time in participantTime{
                if time != nil{
                    if time < min || min == nil{
                        min = time
                    }
                }
            }
            
            if min == nil{
                return nil
            }else{
                index = participantTime.indexOf{$0 == min}
                return participantArray[index!]
            }
        }
    }
    
    func raceTimeForParticipant(participant: Participant) -> Int?{
        let result: Int?
        let index = participantArray.indexOf{$0.name == participant.name}
        if index == nil{
            return nil
        }else{
            result = participantTime[index!]
            return result
        }
    }
}