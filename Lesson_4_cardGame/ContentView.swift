//
//  ContentView.swift
//  Lesson_4_cardGame
//
//  Created by Berke Cora on 2.10.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    
    @State var playerScore = 0
    @State var cpuScore = 0
    
    @State private var showAlert = false
    @State private var alertMessage = ""
   
    
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
            
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text(alertMessage),
                        message: Text("Would you like to play again?"),
                        dismissButton: .default(Text("Try Again"), action: resetGame)
                    )
                }
        }
        
    }
    
    func dealCard(){
        // Randomize the players card
        let playerCardValue = Int.random(in: 2...14)
        
        playerCard = "card" + String(playerCardValue)
        // Randomize the cpus card
        let cpusCardValue = Int.random(in: 2...14)
        cpuCard = "card" + String(cpusCardValue)
        // Update scores
        
        if playerCardValue > cpusCardValue {
            playerScore += 1
        }
        else if cpusCardValue > playerCardValue{
            cpuScore += 1
        }
        
        if  playerScore == 3 {
            alertMessage = "Congratulations! You won!"
                        showAlert = true
        }
        else if cpuScore == 3 {
            alertMessage = "CPU won! Better luck next time!"
                        showAlert = true
        }
        
        
    }
    
    func resetGame(){
        playerScore = 0
        cpuScore = 0
        playerCard = "back"
        cpuCard = "back"
    }
    
    
}

#Preview {
    ContentView()
}
