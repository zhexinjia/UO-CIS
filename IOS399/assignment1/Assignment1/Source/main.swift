//
//  main.swift
//  Assignment1
//

let instance = TriathlonEvent(triathlon: Triathlon.HalfIronman)

let swimmer1 = Swimmer(name: "Cassi")
instance.registerParticipant(swimmer1)
let swimmer2 = Swimmer(name: "Jason")
instance.registerParticipant(swimmer2)
let swimmer3 = Swimmer(name: "Kathy")
instance.registerParticipant(swimmer3)

let Cyclist1 = Cyclist(name: "Asia")
instance.registerParticipant(Cyclist1)
let Cyclist2 = Cyclist(name: "David")
instance.registerParticipant(Cyclist2)

let Runner1 = Runner(name: "Sigh")
instance.registerParticipant(Runner1)
let Runner2 = Runner(name: "Becky")
instance.registerParticipant(Runner2)

let Athlete1 = Athlete(name: "Charles")
instance.registerParticipant(Athlete1)
let Athlete2 = Athlete(name: "Chuck")
instance.registerParticipant(Athlete2)

instance.performEvent()

if instance.winner != nil{
    let time = instance.raceTimeForParticipant(instance.winner!)!
    print(instance.winner!.name + " wins first place with a total time of " + String(time) + " minutes")
}else{
    print("no winner")
}





