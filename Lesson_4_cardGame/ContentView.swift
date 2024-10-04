//
//  ContentView.swift
//  Lesson_4_cardGame
//
//  Created by Berke Cora on 2.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card7"
    @State var cpuCard = "card13"
    
  @State var playerScore = 0
   @State var cpuScore = 0
    
    
    var body: some View {
        
        ZStack{
            Image("background-plain").resizable().ignoresSafeArea()
                
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                }.padding()
                Spacer()
                
                
                Button(action: {
                    dealCard()
                }, label: {
                    Image("button")
                })
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(playerScore)).font(.largeTitle)
                    }
                    Spacer()
                    VStack{
                        Text("CPU").font(.headline)
                            .padding(.bottom, 10.0)
                        Text(String(cpuScore)).font(.largeTitle)
                    }
                    Spacer()
                }.foregroundColor(.white)
                Spacer()
                
                
            }.padding()

        }
        
    }
    
    func dealCard(){
        // Randomize the players card
        var playerCardValue = Int.random(in: 2...14)
        
        playerCard = "card" + String(playerCardValue)
        // Randomize the cpus card
        var cpusCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpusCardValue)
        // Update scores
        
        if playerCardValue > cpusCardValue {
            playerScore += 1
        }
        else if cpusCardValue > playerCardValue{
            cpuScore += 1
        }
        
        
    }
    
}

#Preview {
    ContentView()
}
