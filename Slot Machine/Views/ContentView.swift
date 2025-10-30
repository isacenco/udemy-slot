//
//  ContentView.swift
//  Slot Machine
//
//  Created by Ghenadie Isacenco on 30/10/2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    
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
                        
                        Text("100")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    }
                    .modifier(ScoreContainerModifier())
                    Spacer()
                    HStack {
                        Text("200")
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
                        
                        Image("gfx-bell")
                            .resizable()
                            .modifier(ImageModifier())
                    }
                    
                    HStack(alignment: .center, spacing: 0) {
                        // MARK: - REEL #2
                        ZStack {
                            ReelView()
                            
                            Image("gfx-seven")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                        Spacer()
                        // MARK: - REEL #3
                        ZStack {
                            ReelView()
                            
                            Image("gfx-cherry")
                                .resizable()
                                .modifier(ImageModifier())
                        }
                    }
                    .frame(maxWidth: 400)
                    
                    // MARK: - SPIN BUTTON
                    Button {
                        print("Spin The Reels")
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
                    print("Info View")
                }, label: {
                    Image(systemName: "info.circle")
                        
                })
                .modifier(ButtonModifier())
                , alignment: .topTrailing
            )
            .padding()
            .frame(maxWidth: 640)
        } //: ZSTACK
    }
}


// MARK: - PREVIEW
#Preview {
    ContentView()
}
