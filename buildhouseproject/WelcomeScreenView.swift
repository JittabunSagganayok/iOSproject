//
//  WelcomeScreenView.swift
//  buildhouseproject
//
//  Created by pooh on 24/12/2565 BE.
//

import SwiftUI



struct WelcomeScreenView: View {
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
               
                VStack {
                    Spacer()
                    
                    
                    
                    Spacer()
                    
                    
                    VStack {
                        Image("icon")
                            .resizable()
                        
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                        
                            .cornerRadius(10)
                        
                        StrokeText(text: "EasyBuild", width: 2.0, color: .white)
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        
                        Text("The Best Living ")
                            .font(.title3)
                            .fontWeight(.regular)
                            .foregroundColor(.gray)
                        
                    }
                    
                    
                    Spacer()
                    NavigationLink(
                        destination: LoginScreen(),
                        label: {
                            Text("Sign In")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(50)
                        })
                    .navigationBarHidden(true)
                    
                    
                    NavigationLink(
                        destination: ContentView(textinput: " ").navigationBarHidden(true),
                        label: {
                            Text("Continue as guest")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(Color.blue)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.white)
                                .cornerRadius(50.0)
                                .shadow(color: Color.black.opacity(0.08), radius: 60, x: 0.0, y: 16)
                                .padding(.vertical)
                        })
                    .navigationBarHidden(true)
                    
                    HStack {
                        Text("New around here? ")
                        //.font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding(.leading)
                        Text("Sign up")
                            .fontWeight(.bold)
                            .foregroundColor(Color.blue)
                    }
                    
                }
                .offset(y:-50)
                
                .padding()
            }
            .background(
                Image("bg")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            )
        }
    }
}

struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
    }
}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color
    
    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
