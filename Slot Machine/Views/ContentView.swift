//
//  ContentView.swift
//  Slot Machine
//
//  Created by Ghenadie Isacenco on 30/10/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    @State private var showingInfoView: Bool = false
    
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    @State private var reels: Array = [0, 1, 2]
    @State private var highscore: Int = 0
    @State private var coins: Int = 100
    @State private var betAmmount: Int = 10
    @State private var isActiveBet10: Bool = true
    @State private var isActiveBet20: Bool = false
    
    // MARK: - FUNCTIONS
    
    // SPIN THE REELS
    func spinReels() {
        //reels[0] = Int.random(in: 0...symbols.count - 1)
        //reels[1] = Int.random(in: 0...symbols.count - 1)
        //reels[2] = Int.random(in: 0...symbols.count - 1)
        
        reels = reels.map({ _ in
            Int.random(in: 0...symbols.count - 1)
        })
    }
    
    // CHECK THE WINNING
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
            // PLAYER WINS
            playerWins()
            
            // NEW HIGHSCORE
            if coins > highscore {
                newHighscore()
            }
        } else {
            // PLAYER LOSES
            playerLoses()
        }
    }
    
    func playerWins() {
        coins += betAmmount * 10
    }
    
    func newHighscore() {
        highscore = coins
    }
    
    func playerLoses() {
        coins -= betAmmount
    }
    
    func activateBet20() {
        betAmmount = 20
        isActiveBet10 = false
        isActiveBet20 = true
    }
    
    func activateBet10() {
        betAmmount = 10
        isActiveBet10 = true
        isActiveBet20 = false
    }

    // GAME IS OVER
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            // MARK: - BACKGROUND
            LinearGradient(gradient: Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // MARK: - INTERFACE
            
            // MARK: - POPUP


            VStack(alignment: .center, spacing: 5) {
                // MARK: - HEAER
                LogoView()
                
                Spacer()
                // MARK: - SCROE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStype()
                            .multilineTextAlignment(.trailing)
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    Spacer()
                    HStack {
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStype()
                            .multilineTextAlignment(.leading)
                    }
                    .modifier(ScoreContainerModifier())
                }
                
                // MARK: - SLOT MACHINE
                VStack(alignment: .center, spacing: 0) {
                    // MARK: - REEL #1
                    ZStack {
                        ReelView()
                        
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        Spacer()
                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 400)
                    
                    // MARK: - SPIN BUTTON
                    Button {
                        // SPIN THE REELS
                        spinReels()
                        checkWinning()
                    } label: {
                        Image("gfx-spin")
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    }

                    
                } // SLOT MACHINE
                .layoutPriority(2)
                
                // MARK: - FOOTER
                Spacer()
                
                HStack {
                    // MARK: - BET 20
                    HStack(alignment: .center, spacing: 10) {
                        Button {
                            activateBet20()
                        } label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet20 ? Color("ColorYellow") : .white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                        
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet20 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                    }
                    
                    // MARK: - BET 10
                    HStack(alignment: .center, spacing: 10) {
                        Image("gfx-casino-chips")
                            .resizable()
                            .opacity(isActiveBet10 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                        
                        Button {
                            activateBet10()
                        } label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundColor(isActiveBet10 ? Color("ColorYellow") : .white)
                                .modifier(BetNumberModifier())
                        }
                        .modifier(BetCapsuleModifier())
                    }
                }
            }
            // MARK: - BUTTONS
            .overlay(
                // RESET
                Button(action: {
                    print("Reset Game")
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                        
                })
                .modifier(ButtonModifier())
                , alignment: .topLeading
            )
            .overlay(
                // INFO
                Button(action: {
                    showingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                        
                })
                .modifier(ButtonModifier())
                , alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 640)
        } //: ZSTACK
        .sheet(isPresented: $showingInfoView) {
            InfoView()
        }
    }
}


// MARK: - PREVIEW
#Preview {
    ContentView()
}
