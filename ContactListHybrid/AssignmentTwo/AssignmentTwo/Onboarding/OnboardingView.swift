//
//  OnboardingView.swift
//  AssignmentTwo
//
//  Created by RNLD on 2024-04-12.
//

import SwiftUI

struct OnboardingView: View {
    
    @Binding var onboardingRequired: Bool
    
    var body: some View {
        
        ZStack {
            
            LinearGradient( gradient: Gradient( colors: [ .black, .purple ] ), startPoint: .topLeading, endPoint: .bottomTrailing )
                .ignoresSafeArea()
            VStack {
                
                Spacer()
                Image( systemName: "person.text.rectangle.fill" )
                    .font( .system( size: 100 ) )
                    .fontWeight( .semibold )
                    .foregroundColor( .white )
                Spacer()
                Text( "Employees Contact" )
                    .font( .system( size: 60, weight: .bold ) )
                    .multilineTextAlignment( .center )
                    .foregroundColor( .white )
                Spacer()
                Spacer()
                HStack{
                    
                    Text( "R.BAGAPORO.JR" )
                        .font( .system( size: 10, weight: .bold ) )
                    Image( systemName: "c.circle" )
                        .font( .system( size: 10 ) )
                    Text( "2 0 2 4" )
                        .font( .system( size: 10, weight: .bold ) )
                    
                }
                .foregroundColor( .white )
                .padding( .bottom, 10 )
                
                Button {
                    
                    onboardingRequired = false
                    
                } label : {
                    
                    Text( "Done" )
                        .frame( maxWidth: .infinity )
                    
                }
                .buttonStyle( .borderedProminent )
                .controlSize( .large )
                .padding( [ .horizontal ], 40 )
                
            }
        }
    }
}

struct OnboardingView2: View {
    
    @Binding var onboardingRequired: Bool
    
    var body: some View {
        
        VStack {
            
            Spacer()
            Text( "What's New" )
                .font( .system( size: 50,weight: .heavy ) )
            HighightView( sfSymbol: "heart.fill", color: .pink, title: "More Personalized", description: "Top Stories picked for you and recommendations from Siri." )
            HighightView( sfSymbol: "newspaper.fill", color: .red, title: "New Spotlight Tab", description: "Discover great stories selected by our editors." )
            HighightView( sfSymbol: "play.rectangle.fill", color: .blue, title: "Video in Today View", description: "The day's best videos, right in the News widget." )
            Spacer()
            Button {
                
                onboardingRequired = false
                
            } label: {
                
                Text( "Next" )
                    .font( .headline )
                    .frame( maxWidth: .infinity )
            }
            .buttonStyle( .borderedProminent )
            .controlSize( .large )
            .padding( [ .horizontal ], 40 )
            
        }
    }
}

struct HighightView: View {
    
    let sfSymbol    : String
    let color       : Color
    let title       : String
    let description : String
    
    var body: some View {
        
        HStack {
            
            Image(systemName: "\( sfSymbol )" )
                .foregroundColor( color )
                .font( .system( size: 60 ) )
                .padding( .horizontal )
            VStack( alignment: .leading ) {
                
                Text( title )
                    .font( .headline )
                Text( description )
            }
        }
        .padding()
    }
}
